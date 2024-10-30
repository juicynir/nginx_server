![0_mjG1YdoT7xPcnznN](https://github.com/user-attachments/assets/e7c93ab4-7bf5-47da-a98f-677128aeca31)
  
### In this repository I present how I installed, started and configurated an Nginx Server. Besides that, I created a script which ever 5 minutes check if the server is online or offline and register such information in the online log or the offline one. 

## 📦 Table of Contents

- [Technologies](#technologies)
- [How to install the server](#how-to-install-the-server)
- [Servers script](#servers-script)
- [Automating the script](#automating-the-script)



## 🛠️Technologies

<table>
 <tr>
   <td>Ubuntu</td>
   <td>Nginx</td>
 </tr>
 <tr>
   <td>23.10</td>
   <td>1.24</td>
 </tr>
  
</table>

## 💿How to install the server

1) Update the list of available packages for Ubuntu
```bash 
$ sudo apt update

```
![Captura de tela 2024-10-27 081052](https://github.com/user-attachments/assets/ec75e047-97b9-473a-bb91-bd6223fabb05)

2) Installing Nginx
```bash 
$ sudo apt install nginx

```
![Captura de tela 2024-10-27 082745](https://github.com/user-attachments/assets/b4d5cace-5ccf-4d87-98ee-b13c68f0690b)

3) Configuring Firewall UFW<br>
- 3.1 Checking UFW application list: 
```bash 
$ sudo ufw app list

```
![Captura de tela 2024-10-30 175252](https://github.com/user-attachments/assets/fec66127-0e48-433d-ab62-bf81b8ebcf99)

- 3.2 In this project we opened door 80 - Nginx HTTP
```bash 
$ sudo ufw allow 'Nginx HTTP'

```
![Captura de tela 2024-10-30 175515](https://github.com/user-attachments/assets/f85a504e-7437-4c56-94dc-93e4319f187c)

  - 3.2.1 Checking the Firewall status
```bash 
$ sudo ufw status

```
![Captura de tela 2024-10-30 175603](https://github.com/user-attachments/assets/15d44b94-0efe-4fac-bf11-75703f7ff5ac)

- 3.2.2 If the Firewall is inactive, activate it<br>
```bash 
$ sudo ufw enable

```

- 3.3 Checking Nginx server status 
```bash 
$  systemctl status nginx 

```
(after the print, press 'q' to exit)

![Captura de tela 2024-10-30 181932](https://github.com/user-attachments/assets/e3db0ab2-6162-422a-85fd-b3e8f264776b) 

- 3.4 If the server is off, activate it <br>
```bash 
$  systemctl start nginx

```

4) Discovering the server's IP address
```bash 
$  ip addr show

```

After finding out the server's, copy the inet IP and paste it on your browser in order to access the Nginx welcome page.

![Captura de tela 2024-10-30 183838](https://github.com/user-attachments/assets/4393e77b-f352-4c6f-8f6b-bdfe704440df)


## 🗄️Servers script



## 🤖Automating the script



