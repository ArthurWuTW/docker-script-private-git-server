import datetime
import threading
import time
from termcolor import colored
import signal
import os

stop = False



if __name__ == '__main__':
    count_hours = 23
    while not stop:
        count_hours +=1
        print_str = '[BACKUP LOG] Hours Count = '+str(count_hours)
        print(colored(print_str, 'yellow', attrs=['bold']))

        if(count_hours == 24):
            # Do Backup
            print(colored('[BACKUP LOG] Backup process starts', 'yellow', attrs=['bold']))
            os.system('./tar_script.sh')
            os.system('./rsync_whole_home_backup.sh')
            # Reset Count
            count_hours = 0

        time.sleep(60*60)
    print(colored('[BACKUP LOG] Thread process starts', 'yellow', attrs=['bold']))

