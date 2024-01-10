import random
import pymysql
from faker import Faker

fake = Faker()

# MySQL 데이터베이스 연결 
connection = pymysql.connect(host='127.0.0.1',
                             user='root',
                             password='9912',
                             db='diary_db',
                             charset='utf8mb4'
                             )


try:
    with connection.cursor() as cursor:

        # user 더미 데이터 생성
        for _ in range(30):  # 30명의 사용자
            user_pwd = 1234
            nickname = fake.user_name()
            birth = random.randint(19000101, 20210101)
            gender = random.randint(0, 1)
            level = random.randint(1, 10)
            social_id = fake.uuid4()
            introduction = fake.text(max_nb_chars=20)

            # SQL 쿼리문
            user_sql = """
            INSERT INTO user (user_pwd, nickname, birth, gender, made_date, level, social_id, introduction)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
            """

            cursor.execute(user_sql, (user_pwd, nickname, birth, gender, fake.date_time(), level, social_id, introduction))


        # diary 더미 데이터 생성
        for _ in range(50):  # 50개의 일기
            d_content = fake.text()
            d_tag = fake.word()
            user_id = random.randint(1, 30) # 사용자 ID: 1 ~ 30 
            openable = random.randint(0, 1)

            diary_sql = """
            INSERT INTO diary (d_content, d_tag, user_id, openable)
            VALUES (%s, %s, %s, %s)
            """
            cursor.execute(diary_sql, (d_content, d_tag, user_id, openable))


        # essay 더미 데이터 생성 및 삽입
        for _ in range(50):  # 50개의 에세이
            e_title = fake.sentence()
            e_content = fake.text()
            e_category = fake.word()
            user_id = random.randint(1, 30)  # 사용자 ID: 1 ~ 30

            essay_sql = """
            INSERT INTO essay (e_title, e_content, e_category, user_id)
            VALUES (%s, %s, %s, %s)
            """
            cursor.execute(essay_sql, (e_title, e_content, e_category, user_id))

        
        # user_subscribe 더미 데이터 생성 및 삽입
        for user_id in range(1, 31):
            for _ in range(random.randint(1, 10)):  # 각 사용자별 1~10개의 구독
                following_id = random.randint(1, 30)
                if user_id != following_id:  # 자기 자신을 구독하지 않도록 함
                    user_subscribe_sql = """
                    INSERT INTO user_subscribe (user_id, following_id)
                    VALUES (%s, %s)
                    """
                    cursor.execute(user_subscribe_sql, (user_id, following_id))
        

        # essay_subscribe 더미 데이터 생성 및 삽입
        for user_id in range(1, 31):
            for _ in range(random.randint(1, 5)):  # 각 사용자별 1~5개의 에세이 구독
                following_essay = random.randint(1, 50)
                essay_subscribe_sql = """
                INSERT INTO essay_subscribe (user_id, following_essay)
                VALUES (%s, %s)
                """
                cursor.execute(essay_subscribe_sql, (user_id, following_essay))


        # 변경 사항 커밋
        connection.commit()

finally:

    # 데이터베이스 연결 종료
    connection.close()
