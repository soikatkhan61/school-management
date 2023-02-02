CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    userType ENUM('superadmin','admin','teacher','student','guerdian','librarian','user') DEFAULT "user",
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255) NOT NULL,
    profilePics varchar(200) DEFAULT "/uploads/avater.jpg",
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
    status int(1) DEFAULT 1,
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

CREATE TABLE IF NOT EXISTS classes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  class_name varchar(255) not null UNIQUE,
  class_description VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS subject_list (
  id INT AUTO_INCREMENT PRIMARY KEY,
  class_id int not null,
  subject_name VARCHAR(255) NOT NULL,
  subject_code VARCHAR(10),
  FOREIGN KEY (class_id) REFERENCES classes(id)
);

CREATE TABLE IF NOT EXISTS chapter (
  id INT AUTO_INCREMENT PRIMARY KEY,
  class_id INT,
  subject_id INT,
  chapter_name VARCHAR(255) NOT NULL,
  FOREIGN KEY (subject_id) REFERENCES subject_list(id),
  FOREIGN KEY (class_id) REFERENCES classes(id)
);

CREATE TABLE IF NOT EXISTS questions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  class_id INT,
  subject_id INT,
  chapter_id INT,
  school_id INT,
  question_text text NOT NULL,
  question_option text NOT NULL,
  question_answer text NOT NULL,
  FOREIGN KEY (subject_id) REFERENCES subject_list(id),
  FOREIGN KEY (class_id) REFERENCES classes(id),
  FOREIGN KEY (chapter_id) REFERENCES chapter(id)
);

