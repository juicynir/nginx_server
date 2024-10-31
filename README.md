![0_mjG1YdoT7xPcnznN](https://github.com/user-attachments/assets/e7c93ab4-7bf5-47da-a98f-677128aeca31)
  
### In this repository I present how I installed, started and configurated an Nginx Server. Besides that, I created a script which was automated to run ever 5 minutes to check if the server is online or offline. In addition, the server's status information is registered either in the online log or the offline log. 

## Table of Contents

- [Technologies](#technologies)
- [How to install the server](#how-to-install-the-server)
- [Servers script](#servers-script)
- [Automating the script](#automating-the-script)
- [Version Control System](#version-control-system)



## Technologies

<table>
 <tr>
   <td>Ubuntu</td>
   <td>Nginx</td>
   <td>Shell Bash</td>
 </tr>
 <tr>
   <td>23.10</td>
   <td>1.24</td>
   <td>5.1.16</td>
 </tr>
  
</table>

## How to install the server

1) Update the list of available packages for Ubuntu
```bash 
sudo apt update

```
![Captura de tela 2024-10-27 081052](https://github.com/user-attachments/assets/ec75e047-97b9-473a-bb91-bd6223fabb05)

2) Installing Nginx
```bash 
sudo apt install nginx

```
![Captura de tela 2024-10-27 082745](https://github.com/user-attachments/assets/b4d5cace-5ccf-4d87-98ee-b13c68f0690b)

3) Configuring Firewall UFW<br>
- 3.1 Checking UFW application list: 
```bash 
sudo ufw app list

```
![Captura de tela 2024-10-30 175252](https://github.com/user-attachments/assets/fec66127-0e48-433d-ab62-bf81b8ebcf99)

- 3.2 In this project we opened door 80 - Nginx HTTP
```bash 
sudo ufw allow 'Nginx HTTP'

```
![Captura de tela 2024-10-30 175515](https://github.com/user-attachments/assets/f85a504e-7437-4c56-94dc-93e4319f187c)

  - 3.2.1 Checking the Firewall status
```bash 
sudo ufw status

```
![Captura de tela 2024-10-30 175603](https://github.com/user-attachments/assets/15d44b94-0efe-4fac-bf11-75703f7ff5ac)

- 3.2.2 If the Firewall is inactive, activate it<br>
```bash 
sudo ufw enable

```

- 3.3 Checking Nginx server status 
```bash 
systemctl status nginx 

```
(after the print, press 'q' to exit)

![Captura de tela 2024-10-30 181932](https://github.com/user-attachments/assets/e3db0ab2-6162-422a-85fd-b3e8f264776b) 

- 3.4 If the server is off, activate it <br>
```bash 
systemctl start nginx

```

4) Discovering the server's IP address
```bash 
ip addr show

```

After finding out the server's, copy the inet IP and paste it on your browser in order to access the Nginx welcome page.

![Captura de tela 2024-10-30 183838](https://github.com/user-attachments/assets/4393e77b-f352-4c6f-8f6b-bdfe704440df)


## Servers script

5) In order to monitor Ngnix status, you may write a Shell script, which will be atomated later on. Choose a location to create a .sh file and write the following code:

```bash 
nano check_nginx.sh

```

```bash 
#!/bin/bash

SERVICE="nginx"

ONLINE_LOG="/home/reports/nginx_online.log"
OFFLINE_LOG="/home/reports/nginx_offline.log"


if systemctl is-active --quiet $SERVICE
then

	echo "$(date '+%Y-%m-%d %H:%M:%S'): Serviço $SERVICE está ONLINE e operante." >> $ONLINE_LOG

else
	echo "$(date '+%Y-%m-%d %H:%M:%S'): Serviço $SERVICE está OFFLINE. Verifique o servidor." >> $OFFLINE_LOG

fi

```

- 5.1 To make the script work properly, it is needed to make it executable. To do it so, use the following command:
```bash 
chmod +x check_nginx.sh
```

- 5.1.1 It is possible top test the script with this command:
```bash 
./check_nginx.sh
```

If everything was done properly, one may get those files on the chosen folder: 

![Captura de tela 2024-10-30 223320](https://github.com/user-attachments/assets/286499a7-fc3a-411f-866f-8788221b8d9d)

- 5.2 Understanding the code
- 5.2.1 Header that discribes what is the used interpreter

```bash 
#!/bin/bash
```

- 5.2.2 The value of the variable SERVICE is the name of the service to be monotored.
```bash 
SERVICE="nginx"
```

- 5.2.3 Path of the online and offline logs, which are created and edited automatically, if one desires so.  

```bash 
ONLINE_LOG="/home/reports/nginx_online.log"
OFFLINE_LOG="/home/reports/nginx_offline.log"
```
- 5.2.4 Condition to register the status either on the online log or the offline log.
  On which of the logs, it is presented the date (year, month, day) and hour.
```bash 
if systemctl is-active --quiet $SERVICE
then

	echo "$(date '+%Y-%m-%d %H:%M:%S'): Serviço $SERVICE está ONLINE e operante." >> $ONLINE_LOG

else
	echo "$(date '+%Y-%m-%d %H:%M:%S'): Serviço $SERVICE está OFFLINE. Verifique o servidor." >> $OFFLINE_LOG
```

## Automating the script

6) In order to automate the script one needs edit 'crontab' by using this command:
```bash 
crontab -e
```
Terminal will ask to choose the editor: 
![Captura de tela 2024-10-30 225330](https://github.com/user-attachments/assets/6e84433f-792f-4d28-acc7-b6ea7be967e7)

Pick one that is fit to your skills on text editing on Terminal.

- 6.1 Write the following line in the crontab file: 
```bash 
*/5 * * * * /home/reports/check_nginx.sh
```

![Captura de tela 2024-10-30 225809](https://github.com/user-attachments/assets/e33927ed-dc21-46c0-907a-efa5a2b3ded6)

Safe and close the file. 

7) To check how to the script is doing, turn it on, wait 5 to 10 minutes. Then turn it off and give some more time for the script register more entries on the logs. If everything is alright, one may get logs as the following: 
(To open the logs, use the command: cat your_file.log)

- 7.1 Online Server
![Captura de tela 2024-10-30 232115](https://github.com/user-attachments/assets/c4f67065-e49c-4616-9763-a9f38c15f021)

- 7.2 Offline Server
![Captura de tela 2024-10-30 231812](https://github.com/user-attachments/assets/ceba3586-a864-4f27-a48e-bad5368e44a5)


## Version Control System

8) Version control

For this project version control was made by web upload. However, if one would like to do version control on Terminal / Bash, one may follow these intrucitions:

- 8.1 Start a Git repository (repo), on the projects directory

```bash 
git init
```

- 8.2 Add files to the repository
```bash 
git add check_nginx.sh
```

- 8.3 Commiting the changes
```bash 
git commit -m "initial commit"  #you may name it was you please
```

- 8.4 Adding a remote repository
```bash 
git remote origin https://github.com/your_github/check_nginx.sh
```

- 8.5 Pushing changes to the main branch
```bash 
git push origin main 
```
