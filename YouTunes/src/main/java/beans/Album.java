package beans;

public class Album {
 private int id;
 private String title;
 private Double price;
 private String genre;
 private String url;
 private int Artistid;
 
 public Album() {
	// TODO Auto-generated constructor stub
}
public Album(String title, Double price, String genre, String url, int Artistid) {
	// TODO Auto-generated constructor stub
	this.title = title;
	this.price = price;
	this.genre = genre;
	this.url = url;
	this.Artistid = Artistid;
}

public Album(Integer id, String title, Double price, String genre, String url, int Artistid) {
	// TODO Auto-generated constructor stub
	this.id = id;
	this.title = title;
	this.price = price;
	this.genre = genre;
	this.url = url;
	this.Artistid = Artistid;
}
public void setid(Integer id) {
	 this.id=id;
 }
 
 public Integer getid () {
	 return id;
 }
 
public void settitle(String title) {
	this.title=title;
}
public String gettitle() {
	return title;
}

public void setprice(Double price) {
	this.price=price;
}

public Double getprice() {
	return price;
}

public void setgenre(String genre) {
	this.genre=genre;
}

public String getgenre() {
	return genre;
}

public void seturl(String url) {
	this.url=url;
}

public String geturl() {
	return url;
}

public void setArtistid(int Artistid) {
	this.Artistid=Artistid;
}

public int getArtistid() {
	return Artistid;
}

@Override
public String toString(){
	return "Album{albumid="+id+", title="+title+", genre="+genre+"}";
	
}
}
