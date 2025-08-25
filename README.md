# server-performance-stats

project page URL : https://roadmap.sh/projects/server-stats

## 📖 Background
When working with servers (such as web servers, databases, or application servers), 
it is important to monitor their performance to ensure they are running smoothly.  

Some of the basic metrics that need to be monitored are:
- **CPU usage** → to see whether the server is busy or idle.
- **Memory usage (RAM)** → to check if there is enough available memory for applications.
- **Disk usage** → to see if the storage is running out of space.
- **Top processes** → to identify which applications consume the most CPU or memory.
- **Additional information** (uptime, load average, logged-in users, failed login attempts, etc.) → 
  useful for debugging and monitoring.

This project provides a simple **Bash script** called `server-stats.sh` that can be run on Linux (or WSL on Windows).  
Its purpose is to quickly provide an overview of server performance directly from the terminal without requiring additional monitoring tools.

---

## 📋 Requirements
- Linux environment  
- Standard tools available in most distributions: `top`, `free`, `df`, `ps`, `uptime`, `who`, `lastb`  

> ⚠️ If you are on Windows, you can use **WSL (Windows Subsystem for Linux)** to run this script.

---

## ▶️ How to Run

1. **Clone the repository**
   ```bash
   git clone https://github.com/username/server-stats.git
   cd server-stats
   ```

2. **Make the script executable**
   ```bash
   chmod +x server-stats.sh
   ```

3. **Run the script**
   ```bash
   ./server-stats.sh
   ```

---

## 📊 Example Output
```
===== Server Performance Stats =====
Hostname   : LAPTOP-BLABLA
OS Version : Linux 6.6.87.2-microsoft-standard-WSL2 x86_64 GNU/Linux
Uptime     : up 3 minutes
Date       : Mon Aug 25 19:41:02 WIB 2025

----- CPU Usage -----
CPU Load: 8.9% (used)

----- Memory Usage -----
Used: 432MB / Total: 5827MB (7.41%)

----- Disk Usage -----
Used: 300G / Total: 1.5T (21% used)

----- Top 5 Processes by CPU -----
  PID COMMAND         %CPU
  482 server-stats.sh  3.5
    1 systemd          0.7
  259 unattended-upgr  0.2
```

---

## 💡 Notes
- The results will vary each time the script is executed because it reads **real-time system metrics**.  
- On WSL, information such as **failed login attempts** may not be available due to the lack of multi-user login.  
- This script can serve as a foundation for building more advanced monitoring tools.
