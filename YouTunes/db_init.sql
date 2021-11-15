

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
img_url	varchar(100)	not null,
artistid	int	  not null,
primary key(albumid),
constraint fkartist
foreign key(artistid) references artist(artistid)
);

insert into artist(firstname, lastname)values ("Bob", "Dylan");
insert into artist(firstname, lastname)values ("Elton", "John");
insert into artist(firstname, lastname)values ("Hank", "Williams");
insert into artist(firstname, lastname)values ("Lorretta", "Lynn");
insert into artist(firstname, lastname)values ("Etta", "James");
insert into artist(firstname, lastname)values ("Ray", "Charles");
insert into artist(firstname, lastname)values ("Odetta","Holmes");

insert into album(title,price, genre, img_url, artistid)values ("The Freewheelin", 22.00, "folk", "images/The_Freewheelin_Bob_Dylan.jpg",(select artistid from artist where lastname ="Dylan"));
insert into album(title,price, genre, img_url, artistid)values ("Blonde on Blonde", 26.00, "folk", "images/blondeonblonde.jpg",(select artistid from artist where lastname ="Dylan"));
insert into album(title,price, genre, img_url, artistid)values ("The Times They Are Changing", 22.00, "folk", "images/The_Times_They_Are_a-Changin_Dylan.jpg",(select artistid from artist where lastname ="Dylan"));
insert into album(title,price, genre, img_url, artistid)values ("Rough and Rowdy Ways", 22.00, "folk", "images/Bob_Dylan_-Rough_and_Rowdy_Ways.png",(select artistid from artist where lastname ="Dylan"));
insert into album(title,price, genre, img_url, artistid)values ("Highway 61 Revisited", 26.00, "folk", "images/Bob_Dylan_Highway_61_Revisited.jpg",(select artistid from artist where lastname ="Dylan"));
insert into album(title,price, genre, img_url, artistid)values ("Infidels", 22.00, "folk", "images/BobDylan_Infidels.jpg",(select artistid from artist where lastname ="Dylan"));
insert into album(title,price, genre, img_url, artistid)values ("Nashville Skyline", 22.00, "folk", "images/BobDylan_Nashville_Skyline.jpg",(select artistid from artist where lastname ="Dylan"));

insert into album(title,price, genre, img_url, artistid)values ("Goodbye Yellow Brick", 29.00, "pop", "images/EltonJohn_Goodbye_Yellow_Brick_Road.jpg",(select artistid from artist where lastname ="John"));
insert into album(title,price, genre, img_url, artistid)values ("The One", 22.00, "pop", "images/Elton_John_The_One_cover.jpg",(select artistid from artist where lastname ="John"));
insert into album(title,price, genre, img_url, artistid)values ("Blue Moves", 20.00, "pop", "images/EltonJohn_Blue_Moves.jpg",(select artistid from artist where lastname ="John"));
insert into album(title,price, genre, img_url, artistid)values ("Captain Fantastic", 27.00, "pop", "images/EltonJohn_Captain_Fantastic_and_the_Brown_Dirt_Cowboy.jpg",(select artistid from artist where lastname ="John"));
insert into album(title,price, genre, img_url, artistid)values ("Tumbleweed Connection", 22.00, "pop", "images/EltonJohn_Tumbleweed_Connection.jpg",(select artistid from artist where lastname ="John"));

insert into album(title,price, genre, img_url, artistid)values ("Beyond the Sunset", 18.00, "country", "images/HankWilliams_Beyond_the_sunset.jpeg.jpg",(select artistid from artist where lastname ="Williams"));
insert into album(title,price, genre, img_url, artistid)values ("Moanin the Blues", 20.00, "country", "images/HankWilliams_Moaning_the_bluesjpeg.jpg",(select artistid from artist where lastname ="Williams"));
insert into album(title,price, genre, img_url, artistid)values ("Honky Tonkin", 21.00, "country", "images/HankWilliams_Honky_tonkin.jpg",(select artistid from artist where lastname ="Williams"));
insert into album(title,price, genre, img_url, artistid)values ("Memorial Album", 20.00, "country", "images/HankWilliams_Memorial_Album.jpg",(select artistid from artist where lastname ="Williams"));

insert into album(title,price, genre, img_url, artistid)values ("Home", 29.00, "country", "images/LorettaLynn_Home.jpg",(select artistid from artist where lastname ="Lynn"));
insert into album(title,price, genre, img_url, artistid)values ("Still Woman Enough", 23.00, "country", "images/LorettaLynn_StillWomanEnoughAlbum.jpg",(select artistid from artist where lastname ="Lynn"));
insert into album(title,price, genre, img_url, artistid)values ("Louisiana Woman", 27.00, "country", "images/LorettaLynn_LouisanWoman.jpg",(select artistid from artist where lastname ="Lynn"));
insert into album(title,price, genre, img_url, artistid)values ("Van Lear Rose", 26.00, "country", "images/LorettaLynn-Van-Lear-Rose.jpg",(select artistid from artist where lastname ="Lynn"));
insert into album(title,price, genre, img_url, artistid)values ("Full Circle", 24.00, "country", "images/LorettaLynn-Full_Circle.jpeg",(select artistid from artist where lastname ="Lynn"));

insert into album(title,price, genre, img_url, artistid)values ("At Last", 25.00, "R&B", "",(select artistid from artist where lastname ="James"));
insert into album(title,price, genre, img_url, artistid)values ("Tell Mama", 32.00, "R&B", "images/EttaJames_Tell_Mama.jpg",(select artistid from artist where lastname ="James"));
insert into album(title,price, genre, img_url, artistid)values ("The Dreamer", 19.00, "R&B", "images/EttaJames_the_dreamer.jpg",(select artistid from artist where lastname ="James"));
insert into album(title,price, genre, img_url, artistid)values ("The Second Time Around", 20.00, "R&B", "images/EttaJames_The_Second_time_around.jpg",(select artistid from artist where lastname ="James"));

insert into album(title,price, genre, img_url, artistid)values ("Whatd I Say", 25.00, "R&B", "images/RayCharles_WhatdISay.jpg",(select artistid from artist where lastname ="Charles"));
insert into album(title,price, genre, img_url, artistid)values ("Together Again", 26.00, "R&B", "images/RayCharles_Together_again.jpg",(select artistid from artist where lastname ="Charles"));
insert into album(title,price, genre, img_url, artistid)values ("Genuis Loves", 29.00, "R&B", "images/RayCharles-Genius_loves_company.jpg",(select artistid from artist where lastname ="Charles"));
insert into album(title,price, genre, img_url, artistid)values ("Yes Indeed", 35.00, "R&B", "images/RayCharles_Yes_indeed.jpg",(select artistid from artist where lastname ="Charles"));
insert into album(title,price, genre, img_url, artistid)values ("The Genius Afterhours", 30.00, "R&B", "images/RayCharles_Thegeniusafterhours.jpg",(select artistid from artist where lastname ="Charles"));
insert into album(title,price, genre, img_url, artistid)values ("True to Life", 30.00, "R&B", "images/RayCharles_True_to_Life.jpg",(select artistid from artist where lastname ="Charles"));

insert into album(title,price, genre, img_url, artistid)values ("My Eyes Have Seen", 40.00, "folk", "images/Odetta_My_eyes_have_seen.jpg",(select artistid from artist where lastname ="Holmes"));
insert into album(title,price, genre, img_url, artistid)values ("Odetta Sings Dylan", 33.00, "folk", "images/Odetta_Sings_Dylan.jpg",(select artistid from artist where lastname ="Holmes"));
insert into album(title,price, genre, img_url, artistid)values ("Odetta Sings Ballads", 34.00, "folk", "images/Odetta_Sings_Ballads_and_Blues_CD_cover.jpg",(select artistid from artist where lastname ="Holmes"));
insert into album(title,price, genre, img_url, artistid)values ("One Grain of Sand", 40.00, "blues", "images/Odetta_One_grain_of_sand.jpg",(select artistid from artist where lastname ="Holmes"));
insert into album(title,price, genre, img_url, artistid)values ("Odetta and the Blues", 39.00, "folk", "images/Odetta_and_the_blues.jpg",(select artistid from artist where lastname ="Holmes"));





