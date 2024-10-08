Redommended sequence of execution:
    1. title.basic 
    2. title.ratings 
    3. name.basics
    4. title.episodes
    5. title.crew
    6. title.principals

DONT FORGET TO CHANGE THE LOAD DATA INFILE FILEPATH TO YOUR OWN PATH.


NOTE: 
Because the data set is huge, the default buffer pool size 8MB which is not enough to load some of the tables. 
You will need to increase the buffer pool size. I increased to 12G, which should be plenty to load the datas. YOU SHOULD INCREASE THIS BASE ON YOUR COMPUTERS MEMORY (recommanded to be 70%-80% or your machine's total memory). 
To increase the buffer pool size, you need to go in to yor my.cnf file for mySQL. Which is typically locatted in /etc/mysql/my.cnf 
use a editor for example nano (should come with mac), run 'sudo nano my.cnf'
Once in the file you will see:
    [mysqld]
    secure-file-priv = ""
    local-infile=1
    [client]
    loose-local-infile=1

Simply add the line 'innodb_buffer_pool_size=12G ' under the [mysqld]. 
Also add some other configs to increase load run time. 

Your ending my.cnf file should look like this: 
    [mysqld]
    secure-file-priv = ""
    local-infile=1
    innodb_buffer_pool_size=12G
    innodb_log_buffer_size = 128M
    innodb_log_file_size=1G
    innodb_io_capacity = 2000
    max_allowed_packet = 256M
    interactive_timeout = 28800
    wait_timeout = 28800
    net_read_timeout = 300
    net_write_timeout = 300
    [client]
    loose-local-infile=1

press control + X, then y, then enter to exit out nano editor. 
Restart your mySQL from the setting or with commandline. 