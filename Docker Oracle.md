# 윈도우 도커(docker)로 오라클(oracle) 설치 하기
> [!quote]  
> (1) https://stricky.tistory.com/395  
> (2) https://stricky.tistory.com/396

> SQLP 공부 방법  
> https://velog.io/@sua_ahn/SQLP-3%EA%B0%9C%EC%9B%94-%EB%8F%85%ED%95%99-%ED%95%A9%EA%B2%A9-%ED%9B%84%EA%B8%B0-51%ED%9A%8C

1. Docker Desktop 설치
    - https://www.docker.com/get-started/

2. WSL2kernel 설치

3. 설치 완료 확인
    - CMD or Power Shell
        - docker --version

4. 도커를 통해 오라클 설치
    1. 도커 허브 사이트에서 설치할 컨테이너 확인
        - https://hub.docker.com/
    2. 이미지파일 다운
        - CMD or Power Shell
            - docker pull <이미지이름>
    3. 이미지를 이용해 컨테이너 실행 (원하는 포트로 설정)
        - docker run -d -p 8080:8080 -p 1521:1521 <이미지이름>
    4. 설치된 컨테이너 확인(도커 프로세스 조회)
        - docker ps -a
    5. 설치 과정 확인
        - docker logs <컨테이너이름>

5. 도커에 설치된 오라클 접속
    1. 컨테이너 접속
        - docker exec -it <컨테이너이름> bash
    2. 열린 포트 확인
        - netstat -nlpt
    3. 오라클 접속
        - su oracle
        - cd $ORACLE_HOME
    4. sqlplus를 이용해 오라클 서버 접속
        - bin/sqlplus / as sysdba
    5. 정상 접속 확인
        - SELECT status FROM v$instance;

6. 오라클 사용자 계정 추가
    1. 계정 생성
        - create user 원하는계정명 identified by "원하는비밀번호";
    2. 권한 부여
        - grant dba to 원하는계정명 with admin option;

+ 명령어
- 컨테이너 삭제
    - docker rm (-f) <컨테이너이름>
        - f : 강제 종료
- 이미지 삭제
    - docker image rm <이미지이름>
- 로그 확인
    - du -sh /var/lib/docker/containers/*
- 로그 파일 수동 삭제
    - truncate -s 0 /var/lib/docker/containers/<container-id>/*-json.log
- 자동 로그 제한 설정 (docker run 시)
    ```bash
    docker run \
    --log-driver json-file \
    --log-opt max-size=10m \
    --log-opt max-file=3 \
    ...
    ```


