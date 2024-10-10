#!/bin/bash
#

display_usage() {
        echo "Usage: ${0} <source path> <path to backup folder>"
}

if [[ "${#}" -eq 0 ]]
then
        display_usage
fi

source_dir=$1
timestamp=$(date '+%Y-%m-%d-%H-%M-%S')
backup_dir=$2

create_backup(){
        tar -czvf "${backup_dir}/backup_${timestamp}.tar.gz" --transform 's,^/,,g' "${source_dir}" &> /dev/null

        if [[ "${?}" -ne 0 ]]
        then
                echo "Backup was not created for ${timestamp}"
                exit 1
        fi
}


perform_ratation() {
        backups=($(ls -t "${backup_dir}/backup_"*.tar.gz 2>/dev/null))
        
        if [[ "${#backups[@]}" -gt 5 ]]
        then
                echo 'Performing totation for 5 days'

                backup_to_remove=("${backups[@]:5}")
                echo "${backup_to_remove[@]}"

                for backup in "${backup_to_remove[@]}";
                do
                        rm -f ${backup}
                done

        fi


}


create_backup
perform_ratation
