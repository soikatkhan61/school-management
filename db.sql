CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    userType ENUM('admin','user','moderator') DEFAULT "user",
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255) NOT NULL,
    isVerified int(1) DEFAULT 0,
    verfication_id int(8) DEFAULT -1,
    profilePics varchar(200) DEFAULT "/uploads/avater.jpg",
    isBanned ENUM('0','1') DEFAULT "0",
    device int(2) DEFAULT 1,
    subscription int(2),
    createdAt TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)
);

CREATE TABLE IF NOT EXISTS schools (
    id INT PRIMARY KEY AUTO_INCREMENT,
    school_name varchar(250) NOT NULL,
    school_address varchar(500),
    school_email varchar(100),
    school_phone varchar(15) NOT NULL,
    school_info varchar(500),
    admin_name varchar(30) NOT NULL,
    admin_blood_group varchar(5),
    admin_address varchar(500),
    admin_phone varchar(15) NOT NULL,
    admin_email varchar(100) NOT NULL,
    admin_password varchar(250) NOT NULL,
    admin_avater varchar(250) DEFAULT "/uploades/school/admin_avater.png",
    staus int(1) DEFAULT 1,
    createdAt TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)
);

CREATE TABLE IF NOT EXISTS packages (
    id INT PRIMARY KEY AUTO_INCREMENT,
    package_name  ENUM("silver","gold","platinum") not null,
    price int(6) NOT NULL ,
    package_comission int(6) NOT NULL ,
    total_subscriber int(6) NOT NULL,
    createdAt TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)
);

INSERT INTO `packages`(`id`, `package_name`, `price`, `package_comission`, `total_subscriber`, `createdAt`) VALUES (null,'silver',1000,2,0,null);
INSERT INTO `packages`(`id`, `package_name`, `price`, `package_comission`, `total_subscriber`, `createdAt`) VALUES (null,'gold',5000,3,0,null);
INSERT INTO `packages`(`id`, `package_name`, `price`, `package_comission`, `total_subscriber`, `createdAt`) VALUES (null,'platinum',30000,5,0,null);



CREATE TABLE IF NOT EXISTS pkg_subscriber (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pkg_id  int, FOREIGN KEY(pkg_id) REFERENCES packages(id),
    user_id int ,FOREIGN KEY(user_id) REFERENCES users(id),
    approval_status int (1) DEFAULT 0,
    createdAt TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    updatedAt TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)
);

CREATE TABLE IF NOT EXISTS pkg_payment(
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id int ,FOREIGN KEY(user_id) REFERENCES users(id),
    pkg_sub_id  int, FOREIGN KEY(pkg_sub_id) REFERENCES pkg_subscriber(id),
    pkg_id  int, FOREIGN KEY(pkg_id) REFERENCES packages(id),
	payment_method ENUM('Bkash','Rocket'),
    phone_no varchar(15) not null,
    transaction_number varchar(50) not null,
    message varchar(1000) DEFAULT null,
    createdAt TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    updatedAt TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)
);


CREATE TABLE IF NOT EXISTS contact (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name varchar (50) not null,
    email VARCHAR(255),
    phone VARCHAR(15) NOT NULL,
    message varchar(1000),
    respond ENUM('yes','no'),
    createdAt TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)
);



CREATE TABLE IF NOT EXISTS login_sessions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id  int(6) not null,
    session_id varchar(100) NOT NULL ,
    login_time TIMESTAMP(6)
);