# CPU TEMP WEBHOOK
## Send alerts on threshold via TG bot 

1. Firstly you should install lm-sensors:

```bash
apt install lm-sensors
````

2. Clone this repo and open the script:
```bash
git clone https://github.com/WADPH/cpu-temp-webhook.git
cd cpu-temp-webhook
chmod +x cpu-temp-webhook.sh
nano cpu-temp-webhook.sh
````

4. Then put your TG BOT Token and your CHAT ID, also you may want change threshold:
```bash
TOKEN="<YOUR_TOKEN>"
CHAT_ID="<YOUR_CHAT_ID>"
THRESHOLD=75
````

5. Create cron task:
```bash
crontab -e
*/10 * * * * /path/to/cpu-temp-webhook.sh
````
