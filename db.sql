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
INSERT INTO `schools`(`id`, `school_name`, `school_address`, `school_email`, `school_phone`, `school_info`, `admin_name`, `admin_blood_group`, `admin_address`,`admin_phone`, `admin_email`,`admin_password`, `admin_avater`,`status`,`createdAt`) VALUES (null,'SHS','Demo Adress','shs@gmail.com','01733333','info demo','school_admin','b+','admin_adress','01822222','admin@gmail.com','$2b$11$GXOU60o9gOTiEe0pkjAR9.vKrcRzvagio0ZmYz1tPDHpt4CwiaM4G',null,1,null);

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
  question_text text NOT NULL,
  question_option text NOT NULL,
  question_answer text NOT NULL,
  FOREIGN KEY (subject_id) REFERENCES subject_list(id),
  FOREIGN KEY (class_id) REFERENCES classes(id),
  FOREIGN KEY (chapter_id) REFERENCES chapter(id)
);

CREATE TABLE IF NOT EXISTS creative (
  id INT AUTO_INCREMENT PRIMARY KEY,
  class_id INT,
  subject_id INT,
  chapter_id INT,
  question_text text NOT NULL,
  question_option text NOT NULL,
  FOREIGN KEY (subject_id) REFERENCES subject_list(id),
  FOREIGN KEY (class_id) REFERENCES classes(id),
  FOREIGN KEY (chapter_id) REFERENCES chapter(id)
);

CREATE TABLE IF NOT EXISTS students (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  student_id VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  school_id INT (11) NOT NULL,
  gender ENUM('male', 'female', 'other') NOT NULL,
  dob DATE NOT NULL,
  address VARCHAR(355),
  avater VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (school_id) REFERENCES schools(id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS teachers (
  id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  userType ENUM('superadmin','admin','teacher','student','guerdian','librarian','user') DEFAULT "user", 
  name VARCHAR(100) NOT NULL,
  username VARCHAR(30) NOT NULL,
  email VARCHAR(100),
  phone varchar(15) not null,
  password VARCHAR(255) NOT NULL,
  school_id INT(11),
  avater VARCHAR(300),
  FOREIGN KEY (school_id) REFERENCES schools(id)
);
CREATE TABLE IF NOT EXISTS moderator (
  id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  userType ENUM('moderator'), 
  name VARCHAR(100) NOT NULL,
  username VARCHAR(30) NOT NULL,
  email VARCHAR(100),
  phone varchar(15) not null,
  password VARCHAR(255) NOT NULL,
  avater VARCHAR(300)
);


CREATE TABLE IF NOT EXISTS q_set (
  id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name varchar(150) not null, 
  class_id int(11) not null, 
  subject varchar(50) not null,
  formate varchar(50) not null,
  total_mark int(4) not null, 
  total_qus int(4) not null,
  questions varchar(300),
  school_id int(11) not null,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (school_id) REFERENCES schools(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (class_id) REFERENCES classes(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS exams (
  id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  code VARCHAR(20) NOT NULL,
  q_set_id INT(11) NOT NULL,
  class varchar(50) not null, 
  subject varchar(50) not null, 
  start_time DATETIME NOT NULL,
  end_time DATETIME NOT NULL,
  school_id INT(11),
  teacher_id INT(11),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (school_id) REFERENCES schools(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (teacher_id) REFERENCES teachers(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (q_set_id) REFERENCES q_set(id) ON DELETE CASCADE ON UPDATE CASCADE
);