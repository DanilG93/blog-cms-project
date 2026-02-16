INSERT INTO roles (authority) VALUES ('ROLE_ADMIN'), ('ROLE_BLOGGER');

INSERT INTO users (username, email, enabled, image, name, password, phone, surname) VALUES ('admin', 'admin@blog.com', 1, 'admin.jpg', 'Glavni', '{bcrypt}$2a$12$LGRT0aT9L0cMZ/kXTPL6I.pVAa0ACrBDmFDG9S6rHf5JLbAoasV3C', '0601234567', 'Admin');
INSERT INTO users (username, email, enabled, image, name, password, phone, surname) VALUES ('marko', 'marko@blog.com', 1, 'marko.jpg', 'Marko', '{bcrypt}$2a$12$LGRT0aT9L0cMZ/kXTPL6I.pVAa0ACrBDmFDG9S6rHf5JLbAoasV3C', '0612345678', 'Marković');
INSERT INTO users (username, email, enabled, image, name, password, phone, surname) VALUES ('jelena', 'jelena@blog.com', 1, 'jelena.jpg', 'Jelena', '{bcrypt}$2a$12$LGRT0aT9L0cMZ/kXTPL6I.pVAa0ACrBDmFDG9S6rHf5JLbAoasV3C', '0623456789', 'Jovanović');
INSERT INTO users (username, email, enabled, image, name, password, phone, surname) VALUES ('david', 'david@blog.com', 1, 'david.jpg', 'David', '{bcrypt}$2a$12$LGRT0aT9L0cMZ/kXTPL6I.pVAa0ACrBDmFDG9S6rHf5JLbAoasV3C', '0634567890', 'Petrović');
INSERT INTO users (username, email, enabled, image, name, password, phone, surname) VALUES ('ana', 'ana@blog.com', 1, 'ana.jpg', 'Ana', '{bcrypt}$2a$12$LGRT0aT9L0cMZ/kXTPL6I.pVAa0ACrBDmFDG9S6rHf5JLbAoasV3C', '0645678901', 'Nikolić');

INSERT INTO authorities (username, authority) VALUES ('admin', 'ROLE_ADMIN'), ('marko', 'ROLE_BLOGGER'), ('jelena', 'ROLE_BLOGGER'), ('david', 'ROLE_BLOGGER'), ('ana', 'ROLE_BLOGGER');

INSERT INTO categories (name, description, display_order, seo_url) VALUES ('Growth', 'Strategies for personal and business growth', 1, 'growth'), ('Local', 'Local community news and events', 2, 'local'), ('Sales', 'Sales techniques and marketing strategies', 3, 'sales'), ('Tips', 'Daily tips and tricks for productivity', 4, 'tips');

INSERT INTO tags (name, seo_url) VALUES ('Business', 'business'), ('Technology', 'technology'), ('Fashion', 'fashion'), ('Sports', 'sports'), ('Economy', 'economy');

INSERT INTO posts (title, description, content, image, created_at, enabled, important, view_count, seo_url, category_id, username) VALUES ('Business Growth Strategies 2024', 'Discover the top strategies for growing your business in the competitive market of 2024 and beyond.', 'Content about business growth...', 'post1.jpg', NOW(), 1, 1, 150, 'business-growth-strategies', 1, 'admin');
INSERT INTO posts (title, description, content, image, created_at, enabled, important, view_count, seo_url, category_id, username) VALUES ('Local Market Trends Analysis', 'An in-depth analysis of the local market trends and how they affect small business owners in the region.', 'Content about local markets...', 'post2.jpg', NOW(), 1, 0, 85, 'local-market-trends', 2, 'marko');
INSERT INTO posts (title, description, content, image, created_at, enabled, important, view_count, seo_url, category_id, username) VALUES ('Top Sales Techniques for Beginners', 'Learn the essential sales techniques that every beginner needs to know to close deals effectively.', 'Content about sales...', 'post3.jpg', NOW(), 1, 1, 300, 'top-sales-techniques', 3, 'jelena');
INSERT INTO posts (title, description, content, image, created_at, enabled, important, view_count, seo_url, category_id, username) VALUES ('Productivity Tips for Remote Work', 'Boost your productivity with these essential tips designed specifically for remote workers and freelancers.', 'Content about tips...', 'post4.jpg', NOW(), 1, 0, 120, 'productivity-tips', 4, 'david');
INSERT INTO posts (title, description, content, image, created_at, enabled, important, view_count, seo_url, category_id, username) VALUES ('Economy and Sports Impact', 'How the current state of the economy is impacting the sports industry and sponsorship deals globally.', 'Content about economy...', 'post5.jpg', NOW(), 1, 1, 500, 'economy-sports-impact', 1, 'ana');

INSERT INTO posts_tags (post_id, tag_id) VALUES (1, 1), (1, 5), (2, 1), (2, 5), (3, 1), (4, 2), (5, 4), (5, 5);

INSERT INTO comments (name, email, content, created_at, enabled, is_read, post_id) VALUES ('Pera', 'pera@gmail.com', 'Odličan tekst o biznisu!', NOW(), 1, 1, 1);
INSERT INTO comments (name, email, content, created_at, enabled, is_read, post_id) VALUES ('Mika', 'mika@gmail.com', 'Imam pitanje o prodaji.', NOW(), 1, 1, 3);