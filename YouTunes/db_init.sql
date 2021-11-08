create user 'youtunes_user'@'localhost' identified with mysql_native_password by 'music';
grant all privileges on youtunes.* to 'youtunes_user'@'localhost';

create table artist (
artistid	int	not null	auto_increment, 
firstname	varchar(50)	not null, 
lastname	varchar(50) not null,
primary key(artistid)
);

create table album(
albumid	int	not null	auto_increment,
title	varchar(100)	not null, 
price	decimal(5,2)	not null, 
genre	varchar(50)	    not null, 
ing_url	varchar(100)	not null,
artistid	int	  not null,
primary key(albumid),
constraint fk_artist
foreign key(artist id)
references artist(artistid)
);

insert into artist(firstname, lastname)values ("Bob", "Dylan");
insert into artist(firstname, lastname)values ("Elton", "John");
insert into artist(firstname, lastname)values ("Hank", "Williams");
insert into artist(firstname, lastname)values ("Lorretta", "Lynn");
insert into artist(firstname, lastname)values ("Etta", "James");
insert into artist(firstname, lastname)values ("Ray", "Charles");
insert into artist(firstname, lastname)values ("Odetta","Holmes");

insert into album(title,price, genre, img_url, artistid)values ("The Freewheelin", 22.00, "folk", "",(select artistid from artist where lastname ="Dylan"));
insert into album(title,price, genre, img_url, artistid)values ("Blonde on Blonde", 26.00, "folk", "",(select artistid from artist where lastname ="Dylan"));
insert into album(title,price, genre, img_url, artistid)values ("The Times They Are Changing", 22.00, "folk", "",(select artistid from artist where lastname ="Dylan"));
insert into album(title,price, genre, img_url, artistid)values ("Rough and Rowdy Ways", 22.00, "folk", "",(select artistid from artist where lastname ="Dylan"));
insert into album(title,price, genre, img_url, artistid)values ("Highway 61 Revisited", 26.00, "folk", "",(select artistid from artist where lastname ="Dylan"));
insert into album(title,price, genre, img_url, artistid)values ("Infidels", 22.00, "folk", "",(select artistid from artist where lastname ="Dylan"));
insert into album(title,price, genre, img_url, artistid)values ("Nashville Skyline", 22.00, "folk", "",(select artistid from artist where lastname ="Dylan"));

insert into album(title,price, genre, img_url, artistid)values ("Goodbye Yellow Brick", 29.00, "pop", "",(select artistid from artist where lastname ="John"));
insert into album(title,price, genre, img_url, artistid)values ("The One", 22.00, "pop", "",(select artistid from artist where lastname ="John"));
insert into album(title,price, genre, img_url, artistid)values ("Blue Moves", 20.00, "pop", "",(select artistid from artist where lastname ="John"));
insert into album(title,price, genre, img_url, artistid)values ("Captain Fantastic", 27.00, "pop", "",(select artistid from artist where lastname ="John"));
insert into album(title,price, genre, img_url, artistid)values ("Tumbleweed Connection", 22.00, "pop", "",(select artistid from artist where lastname ="John"));

insert into album(title,price, genre, img_url, artistid)values ("Beyond the Sunset", 18.00, "country", "",(select artistid from artist where lastname ="Williams"));
insert into album(title,price, genre, img_url, artistid)values ("Moanin the Blues", 20.00, "country", "",(select artistid from artist where lastname ="Williams"));
insert into album(title,price, genre, img_url, artistid)values ("Honky Tonkin", 21.00, "country", "",(select artistid from artist where lastname ="Williams"));
insert into album(title,price, genre, img_url, artistid)values ("Memorial Album", 20.00, "country", "",(select artistid from artist where lastname ="Williams"));

insert into album(title,price, genre, img_url, artistid)values ("Home", 29.00, "country", "",(select artistid from artist where lastname ="Lynn"));
insert into album(title,price, genre, img_url, artistid)values ("Still Woman Enough", 23.00, "country", "",(select artistid from artist where lastname ="Lynn"));
insert into album(title,price, genre, img_url, artistid)values ("Louisiana Woman", 27.00, "country", "",(select artistid from artist where lastname ="Lynn"));
insert into album(title,price, genre, img_url, artistid)values ("Van Lear Rose", 26.00, "country", "",(select artistid from artist where lastname ="Lynn"));
insert into album(title,price, genre, img_url, artistid)values ("Full Circle", 24.00, "country", "",(select artistid from artist where lastname ="Lynn"));

insert into album(title,price, genre, img_url, artistid)values ("At Last", 25.00, "R&B",(select artistid from artist where lastname ="James"));
insert into album(title,price, genre, img_url, artistid)values ("Tell Mama", 32.00, "R&B", "",(select artistid from artist where lastname ="James"));
insert into album(title,price, genre, img_url, artistid)values ("The Dreamer", 19.00, "R&B", "",(select artistid from artist where lastname ="James"));
insert into album(title,price, genre, img_url, artistid)values ("The Second Time Around", 20.00, "R&B", "",(select artistid from artist where lastname ="James"));

insert into album(title,price, genre, img_url, artistid)values ("What'd I Say", 25.00, "R&B", "",(select artistid from artist where lastname ="Charles"));
insert into album(title,price, genre, img_url, artistid)values ("Together Again", 26.00, "R&B", "",(select artistid from artist where lastname ="Charles"));
insert into album(title,price, genre, img_url, artistid)values ("Genuis Loves", 29.00, "R&B", "",(select artistid from artist where lastname ="Charles"));
insert into album(title,price, genre, img_url, artistid)values ("Yes Indeed", 35.00, "R&B", "",(select artistid from artist where lastname ="Charles"));
insert into album(title,price, genre, img_url, artistid)values ("The Genius Afterhours", 30.00, "R&B", "",(select artistid from artist where lastname ="Charles"));
insert into album(title,price, genre, img_url, artistid)values ("True to Life", 30.00, "R&B", "",(select artistid from artist where lastname ="Charles"));

insert into album(title,price, genre, img_url, artistid)values ("My Eyes Have Seen", 40.00, "folk", "",(select artistid from artist where lastname ="Holmes"));
insert into album(title,price, genre, img_url, artistid)values ("Odetta Sings Dylan", 33.00, "folk", "",(select artistid from artist where lastname ="Holmes"));
insert into album(title,price, genre, img_url, artistid)values ("Odetta Sings Ballads", 34.00, "folk", "",(select artistid from artist where lastname ="Holmes"));
insert into album(title,price, genre, img_url, artistid)values ("One Grain of Sand", 40.00, "blues", "",(select artistid from artist where lastname ="Holmes"));
insert into album(title,price, genre, img_url, artistid)values ("Odetta and the Blues", 39.00, "folk", "",(select artistid from artist where lastname ="Holmes"));





