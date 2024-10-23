![0_mjG1YdoT7xPcnznN](https://github.com/user-attachments/assets/e7c93ab4-7bf5-47da-a98f-677128aeca31)
  
### In this repository I present how I installed, started and configurated an Nginx Server. Besides that, I created a script which ever 5 minutes check if the server is online or offline and register such information in the online log or the offline one. 

## 📦 Contents

<a href="#technologies">Technologies</a>
<a href="#howtoinstalltheserver">How to install the server</a>
<a href="#serversscript">Server's script</a>
<a href="#automatingthescript">Automating the script</a>


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

2) Installing Nginx
```bash 
$ sudo apt install nginx

```
3) Configuring Fireall UFW<br>
- 3.1 Checking UFW application list: 
```bash 
$ sudo ufw app list

```

- 3.2 In this project we opened door 80 - Nginx HTTP
```bash 
$ sudo ufw allow 'Nginx HTTP'

``` 
  - 3.2.1 Checking the Firewall status
```bash 
$ sudo ufw status

```

- 3.2.2 If the Firewall is inactive, activate it<br>
```bash 
$ sudo ufw enable

```

- 3.3 Checking Nginx server status 
```bash 
$  systemctl status nginx 

```
(after the print, press 'q' to exit)

3.4) If the server is off, activate it <br>
```bash 
$  systemctl start nginx

```

## 🗄️ Server's script




