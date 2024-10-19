<h1>Nginx Server<h1>
  
### In this repository I present how I installed, started and configurated an Nginx Server. Besides that, I created a script which ever 5 minutes check if the server is online or offline and register such information in the online log or the offline one. 


## Technologies Used:

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

How to install the server: 

1) Update the list of available packages for Ubuntu: sudo apt update
2) Installing Nginx: sudo apt install nginx
3) Configuring Fireall UFW<br>
3.1) Checking UFW application list: sudo ufw app list<br>
3.2) In this project we opened door 80 - Nginx HTTP: sudo ufw allow 'Nginx HTTP'<br>
3.2.1) Checking the Firewall status: sudo ufw status<br>
3.2.2) If the Firewall is inactive, activate it: sudo ufw enable<br>
3.3) Checking Nginx server status: systemctl status nginx (after the print, press 'q' to exit)<br>
3.4) If the server is off, activate it: systemctl start nginx<br>



