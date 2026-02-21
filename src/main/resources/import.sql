-- 1. ROLES
INSERT INTO `roles` VALUES ('ROLE_ADMIN');
INSERT INTO `roles` VALUES ('ROLE_BLOGGER');

-- 2. USERS
INSERT INTO `users` VALUES ('admin','danil@blog.com', true ,'avatar-danil.jpg','Danil','{bcrypt}$2a$12$LGRT0aT9L0cMZ/kXTPL6I.pVAa0ACrBDmFDG9S6rHf5JLbAoasV3C','0601234567','danil-gomanjuk','Gomanjuk');
INSERT INTO `users` VALUES ('ana','ana@blog.com', true ,'user.svg','Ana','{bcrypt}$2a$10$ZNht32cWkqR9FihGDf84m.r6o3mR89f6vY29.9.5A7T41m.i/mO..','0601112223','ana-ana','Ana');

-- 3. AUTHORITIES
INSERT INTO `authorities` VALUES ('admin','ROLE_ADMIN');
INSERT INTO `authorities` VALUES ('ana','ROLE_BLOGGER');

-- 4. CATEGORIES
INSERT INTO `categories` VALUES (1,'Strategies for personal and business growth',1,'Growth','growth');
INSERT INTO `categories` VALUES (2,'Local community news and events',2,'Local','local');
INSERT INTO `categories` VALUES (3,'Sales techniques and marketing strategies',3,'Sales','sales');
INSERT INTO `categories` VALUES (4,'Daily tips and tricks for productivity',4,'Tips','tips');

-- 5. TAGS
INSERT INTO `tags` VALUES (1,'Business','business');
INSERT INTO `tags` VALUES (2,'Technology','technology');
INSERT INTO `tags` VALUES (3,'Fashion','fashion');
INSERT INTO `tags` VALUES (4,'Sports','sports');
INSERT INTO `tags` VALUES (5,'Economy','economy');

-- 6. SLIDERS
INSERT INTO `sliders` VALUES (1,'Lorem Ipsum','/',1, true ,'pexels-eberhardgross-534164.jpg','What is Lorem Ipsum?');
INSERT INTO `sliders` VALUES (2,'Click','/contact',2, true ,'pexels-thatguycraig000-1563356.jpg','Why do we use it');
INSERT INTO `sliders` VALUES (3,'Cubes IT','https://cubes.edu.rs',3, true ,'pexels-christian-heitz-285904-842711.jpg','Contrary to popular belief, Lorem Ipsum is not simply random text.');
INSERT INTO `sliders` VALUES (4,'Cubes IT','https://cubes.edu.rs',4, true ,'pexels.jpg','Contrary to popular belief, Lorem Ipsum is not simply random text.');

-- 7. CONTACT MESSAGES
INSERT INTO `contact_messages` VALUES (1,'2026-02-21 01:29:23','dragan.antic@mail.com', false ,'Pitanje o oglasima: Poštovani, zanima me koja je cena zakupa banera na vašem blogu za mesec mart?','Dragan Antić');
INSERT INTO `contact_messages` VALUES (2,'2026-02-21 00:14:23','sofija.m@mail.com', false ,'Predlog saradnje: Želela bih da pišem gostujući post na temu modernog marketinga.','Sofija Marković');
INSERT INTO `contact_messages` VALUES (3,'2026-02-20 21:14:23','nemanja.v@mail.com', false ,'Tehnička greška: Primetio sam da se na mobilnom telefonu slike u slajderu ne učitavaju.','Nemanja Vidović');
INSERT INTO `contact_messages` VALUES (4,'2026-02-20 02:14:23','jovan@mail.com', true ,'Sve pohvale za poslednji tekst o CRM sistemima.','Jovan Jovanović');
INSERT INTO `contact_messages` VALUES (5,'2026-02-19 02:14:23','marta.l@mail.com', true ,'Da li planirate neku radionicu uživo?','Marta Lukić');
INSERT INTO `contact_messages` VALUES (6,'2026-02-18 02:14:23','ognjen.s@mail.com', true ,'Problem sa prijavom: Rešio sam problem u međuvremenu.','Ognjen Simić');
INSERT INTO `contact_messages` VALUES (7,'2026-02-17 02:14:23','elena@mail.com', true ,'Hvala vam na brzom odgovoru. Srdačan pozdrav!','Elena Dragić');
INSERT INTO `contact_messages` VALUES (8,'2026-02-16 02:14:23','pavle.k@mail.com', true ,'Ponuda za marketing: Poslao sam vam detaljnu ponudu na email.','Pavle Kostić');

-- 8. POSTS
INSERT INTO `posts` VALUES (1,'Full content for post about growth mindset...','2025-11-23 01:24:46','Discover how to develop a professional growth mindset that attracts success.', true ,'blog-3.jpg', true ,'growth-mindset-2026','The 2026 Growth Mindset',150,1,'admin');
INSERT INTO `posts` VALUES (2,'Full content for post about local SEO tips...','2025-12-01 01:24:46','Implementing small but effective changes to your website for local growth.', true ,'blog-post-1.jpeg', false ,'local-business-seo','Local Business SEO Tips',85,2,'admin');
INSERT INTO `posts` VALUES (3,'Full content for post about closing sales...','2025-12-08 01:24:46','Learn the psychological triggers that help you close deals much faster.', true ,'blog-post-2.jpg', true ,'closing-sale-faster','Closing the Sale Faster',220,3,'admin');
INSERT INTO `posts` VALUES (4,'Full content for post about productivity...','2025-12-15 01:24:46','Start your workday with these five simple habits for maximum output.', true ,'blog-post-1.jpeg', false ,'morning-productivity-hacks','Morning Productivity Hacks',310,4,'admin');
INSERT INTO `posts` VALUES (5,'Full content for post about scaling startup...','2025-12-23 01:24:46','Comprehensive guide on when and how to scale your startup team.', true ,'blog-3.jpg', true ,'scaling-startup-2026','Scaling Your Startup',450,1,'admin');
INSERT INTO `posts` VALUES (6,'Full content for post about community...','2025-12-31 01:24:46','Understand why your brand needs a loyal community.', true ,'blog-post-2.jpg', false ,'community-building-basics','Community Building Basics',110,2,'admin');
INSERT INTO `posts` VALUES (7,'Full content for post about inbound sales...','2026-01-07 01:24:46','Moving away from cold calling and adopting inbound sales.', true ,'blog-3.jpg', true ,'inbound-sales-revolution','Inbound Sales Revolution',190,3,'admin');
INSERT INTO `posts` VALUES (8,'Full content for post about remote meetings...','2026-01-14 01:24:46','Master the art of keeping your distributed team engaged.', true ,'blog-post-3.jpeg', false ,'effective-remote-meetings','Effective Remote Meetings',140,4,'admin');
INSERT INTO `posts` VALUES (9,'Full content for post about investments...','2026-01-22 01:24:46','Where smart money is moving in the next business cycle.', true ,'blog-post-1.jpeg', true ,'investment-trends-growth','Investment Trends 2026',500,1,'admin');
INSERT INTO `posts` VALUES (10,'Full content for post about retail...','2026-01-30 01:24:46','How physical retail stores compete with e-commerce.', true ,'blog-post-3.jpeg', false ,'future-of-local-retail','The Future of Local Retail',95,2,'admin');
INSERT INTO `posts` VALUES (11,'Full content for post about email mastery...','2026-02-06 01:24:46','Write professional cold emails that get positive replies.', true ,'blog-1.jpg', true ,'cold-email-mastery','Cold Email Mastery',275,3,'admin');
INSERT INTO `posts` VALUES (12,'Full content for post about desk setup...','2026-02-11 01:24:46','Creating a physical environment that maximizes focus.', true ,'blog-post-3.jpeg', false ,'desk-setup-deep-work','Desk Setup for Deep Work',425,4,'admin');
INSERT INTO `posts` VALUES (13,'Full content for post about branding...','2026-02-16 01:24:46','Why every professional needs a strong digital presence.', true ,'blog-1.jpg', true ,'personal-brand-growth','Personal Brand Growth',330,1,'admin');
INSERT INTO `posts` VALUES (14,'Full content for post about networking...','2026-02-19 01:24:46','Building lasting professional relationships without anxiety.', true ,'blog-post-3.jpeg', false ,'networking-for-introverts','Networking for Introverts',180,2,'admin');
INSERT INTO `posts` VALUES (15,'Full content for post about CRM...','2026-02-21 01:24:46','Getting the most out of your customer data.', true ,'blog-1.jpg', true ,'advanced-crm-strategies','Advanced CRM Strategies',219,3,'admin');

-- 9. POSTS_TAGS
INSERT INTO `posts_tags` VALUES (1,1);
INSERT INTO `posts_tags` VALUES (3,1);
INSERT INTO `posts_tags` VALUES (6,1);
INSERT INTO `posts_tags` VALUES (10,1);
INSERT INTO `posts_tags` VALUES (13,1);
INSERT INTO `posts_tags` VALUES (15,1);
INSERT INTO `posts_tags` VALUES (2,2);
INSERT INTO `posts_tags` VALUES (4,2);
INSERT INTO `posts_tags` VALUES (8,2);
INSERT INTO `posts_tags` VALUES (11,2);
INSERT INTO `posts_tags` VALUES (14,2);
INSERT INTO `posts_tags` VALUES (7,3);
INSERT INTO `posts_tags` VALUES (12,4);
INSERT INTO `posts_tags` VALUES (5,5);
INSERT INTO `posts_tags` VALUES (9,5);

-- 10. COMMENTS
INSERT INTO `comments` VALUES (1,'Odlična strategija za CRM!','2026-02-21 01:10:20','marko@example.com', true, true,'Marko Kraljević',15);
INSERT INTO `comments` VALUES (2,'Mene zanima kako ovo radi sa Mailchimp-om?','2026-02-21 00:10:20','jelena@example.com', true, true,'Jelena J.',15);
INSERT INTO `comments` VALUES (3,'Ovo je spam komentar 1','2026-02-20 21:10:20','darko@mail.com', false, false,'Darko',15);
INSERT INTO `comments` VALUES (4,'Hvala na korisnim informacijama.','2026-02-20 02:10:20','ivan@mail.com', true, true,'Ivan',15);
INSERT INTO `comments` VALUES (5,'Da li imate još primera?','2026-02-19 02:10:20','milica@mail.com', true, true,'Milica',15);
INSERT INTO `comments` VALUES (6,'Slažem se sa prethodnim komentarom.','2026-02-18 02:10:20','bojan@mail.com', true, true,'Bojan',15);
INSERT INTO `comments` VALUES (7,'Hvala svima na komentarima!','2026-02-21 02:00:20','admin@blog.com', true, true,'Admin Test',15);
INSERT INTO `comments` VALUES (8,'Prvi komentar na blogu!','2026-02-16 02:10:20','pera@gmail.com', true, true,'Pera Perić',1);
INSERT INTO `comments` VALUES (9,'Zanimljiv tekst o prodaji.','2026-02-17 02:10:20','mika@gmail.com', true, true,'Mika Mikic',3);
INSERT INTO `comments` VALUES (10,'Korisni saveti za produktivnost.','2026-02-18 02:10:20','ana@gmail.com', true, true,'Ana',4);
INSERT INTO `comments` VALUES (11,'Super zajednica!','2026-02-19 02:10:20','sloba@gmail.com', true, true,'Sloba',6);
INSERT INTO `comments` VALUES (12,'Inbound je budućnost.','2026-02-20 02:10:20','nikola@gmail.com', true, true,'Nikola',7);
INSERT INTO `comments` VALUES (13,'Sastanci su predugački.','2026-02-20 14:10:20','maja@gmail.com', true, true,'Maja',8);
INSERT INTO `comments` VALUES (14,'Gde uložiti novac?','2026-02-20 16:10:20','kosta@gmail.com', true, true,'Kosta',9);
INSERT INTO `comments` VALUES (15,'Odličan email šablon.','2026-02-20 18:10:20','vuk@gmail.com', true, true,'Vuk',11);
INSERT INTO `comments` VALUES (16,'Moj setup je sličan.','2026-02-20 20:10:20','sara@gmail.com', true, true,'Sara',12);
INSERT INTO `comments` VALUES (17,'Brending je sve.','2026-02-20 22:10:20','luka@gmail.com', true, true,'Luka',13);
INSERT INTO `comments` VALUES (18,'Networking je težak.','2026-02-21 00:10:20','tea@gmail.com', true, true,'Tea',14);