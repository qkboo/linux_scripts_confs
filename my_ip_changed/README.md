# When IP changed report to me by scp, email

이 스크립트와 서비스는 간단히 시스템의 DHCP IP가 변경되면 `scp`로 특정 서버에 변경한 IP를 업로드한다.

This scripts are simply report to destination server by `scp` for system's DHCP ip changed.

## Files

 - **my_ip_changed.sh** : if ip is changed, `scp` ip to destination server
 - **my_ip_changed.service** : systemd script for my_ip_changed.sh

## Install configure and run

내가 테스트한 환경은 일반 사용자 계정에서 **my_ip_changed.sh**를 작성하고 `root` 계정에 link 시키고 systemd 서비스를 설정했다.

At my test, a **my_ip_changed.sh** file is stored under normal user account and link to `root` account.

(1) **my_ip_changed.sh** 를 사용자 적절한 사용자 디렉토리에 복사한다 - `root` 사용자도 무방
두 변수를 설정한다.
store **my_ip_changed.sh** on reliable folder of user home directory - if `root` user's home directory is ok.
 - DEST_IP="DROP_DOWN_SERVER_IP_ADDRESS"
 - CURRENT_IP="file_name"

(2) */etc/systemd/system* 디렉토리에 **my_ip_changed.service** 파일을 넣는다.
copy **my_ip_changed.service** file to */etc/systemd/system* 

```
$ sudo systemctl enable my_ip_changed.service  # 활성화
```

**my_ip_changed.sh** 내용을 수정한 후에, systemd 을 다시 적재한다.
if modify **my_ip_changed.sh** file, reload systemd deamon.

```
$ sudo systemctl daemon-reload
```

(3) 이제 재부팅 할 때 마다 현재 IP 변경시 대상 서버에 변경한 IP를 저장할 수 있다.
finally reboot the system, this script are copy current ip to destination server's folder.

