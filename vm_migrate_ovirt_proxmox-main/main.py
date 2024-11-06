import json
import subprocess
import sys
import paramiko


def open_fucking_file(file_dict):
    temp_file = open(file_dict, 'r')
    temp_dict = json.loads(temp_file.read())
    temp_file.close()
    return temp_dict


def read_file_string(path):
    f = open(path, 'r')
    name_disk = f.readline()
    f.close()
    return  name_disk


def get_vm_disk(disk_id, path_image):
    process = subprocess.Popen(['ansible-playbook', '-i', '/home/dens/ansible/host', '/home/dens/ansible/get_disk_ovirt.yml', '-e', f'disk_id={disk_id} path_image={path_image}'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    stdout, stderr = process.communicate()
    return stdout


def dell_space_str(str_temp):
    str_temp = str(str_temp)
    s = " ".join(str_temp.split())
    return s


def get_list_stdout(s):
    stdout_list = s.split()
    return  stdout_list


def check_list_error(stdout_list):
    for i in stdout_list:
        if i == 'failed=1':
            print(stdout_list)
            sys.exit(1)


def get_ssh_client(ip, port, username, password):
    client = paramiko.SSHClient()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    client.connect(ip, port=port, username=username, password=password)
    return client


# ВЫполнение команды по ссш
def exec_ssh_cmd(client, cmd):
    stdin, stdout, stderr = client.exec_command(cmd)
    result = str(stdout.read())
    result = result.split("\\n")
    return result


def do_job():
    temp_dict = open_fucking_file('/home/dens/ansible/dict_vm_to_migrate.txt')
    ssh_client = get_ssh_client('10.10.200.101', '22', 'root', 'VTt7tPbZEu')
    for vm in temp_dict:
        print(f"Миграция VM: {vm['name']}")
        vm_memory = (vm['memory']//1024//1024)
        pvesh_str = f"pvesh create /nodes/proxmox-01/qemu -vmid {vm['vm_id']} -name {vm['name']} -memory {vm_memory} " \
                    f"-cpu host -sockets 1 -cores {vm['cores']} -scsihw virtio-scsi-single -onboot 1 -agent enabled=1 -boot order=scsi0"
        print(pvesh_str)
        res_pvesh_create = exec_ssh_cmd(ssh_client, pvesh_str)
        print(res_pvesh_create)
        iscsi_id = 0
        net_id = 0
        for d in vm['disks']:
            print(f"Миграция дисков VM {vm['name']}")
            err_stdout = get_vm_disk(f'{d}', 'images')
            str_err_stdout = dell_space_str(err_stdout)
            err_list = get_list_stdout(str_err_stdout)
            check_list_error(err_list)
            temp_disk_dict = open_fucking_file('/home/dens/ansible/roles/ovirt_to_prox/files/temp_disk_dict.txt')
            print(f"{temp_disk_dict['name']}.{temp_disk_dict['format']}")
            pvesh_str_disk = f"pvesh create /nodes/proxmox-01/qemu/{vm['vm_id']}/config --scsi{iscsi_id} data:0," \
                             f"iothread=1,import-from=/mnt/pve/temp-nfs/images/{temp_disk_dict['name']}.{temp_disk_dict['format']}"
            res_pvesh_disk = exec_ssh_cmd(ssh_client, pvesh_str_disk)
            print(res_pvesh_disk)
            delete_old_disk_cmd = f"rm -f /mnt/pve/temp-nfs/images/{temp_disk_dict['name']}.{temp_disk_dict['format']}"
            res_delete_disk = exec_ssh_cmd(ssh_client, delete_old_disk_cmd)
            iscsi_id = iscsi_id + 1
        for n in vm['nics_vlans']:
            print(f"Миграция сетевых интерфейсов VM {vm['name']}")
            pvesh_str_nic = f"pvesh create /nodes/proxmox-01/qemu/{vm['vm_id']}/config -net{net_id} virtio,bridge=vmbr0,tag={n}"
            res_pvesh_net = exec_ssh_cmd(ssh_client, pvesh_str_nic)
            net_id = net_id + 1
    ssh_client.close()


if __name__ == '__main__':
    do_job()
