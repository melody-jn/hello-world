import random, os, time
exit_code  = random.randint(1, 100)
success_percent = int(os.getenv("SUCCESS_PERCENT", "100"))
sleep_second = int(os.getenv("SLEEP_SECOND", "60"))
print("exit code: %s"%({True:0,False:1}[exit_code <= success_percent]))
print("sleep %s second"%sleep_second)
for i in range(sleep_second):
    print("+"*30+"cronjob"+"+"*30)
    time.sleep(1)
os._exit(({True:0,False:1}[exit_code <= success_percent]))
