package beans;

public class Artist {
 private int id;
 private String firstname;
 private String lastname;
 
 public Artist(int id, String firstname, String lastname) {
	 this.id=id; 
	 this.firstname=firstname;
	 this.lastname=lastname;
 }
 public Artist() {
	// TODO Auto-generated constructor stub
}
public Artist(String firstname, String lastname) {
	// TODO Auto-generated constructor stub
	this.firstname = firstname;
	this.lastname = lastname;
}
public void setid(int id) {
	 this.id=id;
 }
 
 public int getid () {
	 return id;
 }
 
public void setfirstname(String firstname) {
	this.firstname=firstname;
}
public String getfirstname() {
	return firstname;
}

public void setlastname(String lastname) {
	this.lastname=lastname;
}

public String getlastname() {
	return lastname;
}

@Override
public String toString(){
	return "Artist{artistid="+id+", firstname="+firstname+", lastname="+lastname+"}";
	
}
}
