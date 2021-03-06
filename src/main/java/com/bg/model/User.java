package com.bg.model;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.TreeSet;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import com.bg.util.isValidEmail;
import com.bg.util.isValidUsername;

public class User {
	public interface ChangeAccount{
		// validation group marker interface
	}
	public interface Register{
		// validation group marker interface
	}
	private long id;
	@NotNull(message = "Please enter username", groups = {Register.class})
	@Pattern(regexp="^[A-Za-z][A-Za-z0-9]{3,19}$",
	message="username must start with a letter, must be between [4-20] chars, and must not contain special chars", groups = {ChangeAccount.class, Register.class})
	@isValidUsername(groups = {ChangeAccount.class, Register.class} )
	private String username;
	@NotNull(message = "Please enter password", groups = {Register.class})
	@Size(min=5, message="password must be at least 5 characters", groups = {Register.class})
	@Pattern(regexp="^(?=.*[0-9])(?=.*[a-zA-Z])([a-zA-Z0-9_-]+)$",
				message="password must contains at least 1 letter and number", groups = {Register.class})
	private String password;
	@NotNull(message = "Please enter email", groups = {Register.class})
	@isValidEmail(groups = {ChangeAccount.class, Register.class})
	private String email;
	private Profile profile;
	private HashSet<Post> likedPosts;
	private HashSet<Comment> likedComments;
	private ArrayList<Post> posts;
	private ArrayList<Comment> comments;
	
	public User() {}
	
	public User(long id, String username) {
		this.id = id;
		this.username = username;
	}
	public User(String username, String email) {
		this.username = username;
		this.email = email;
	}
	public User(String username, String password, String email) {
		this.username = username;
		this.password = password;
		this.email = email;
	}
	public User(long id, String username, String password, String email) {
		this(username,password,email);
		this.id=id;
	}
	public User(Long id, String username, String password, String email, HashSet<Post> likedPosts, HashSet<Comment> likedComments) {
		this(username, password, email);
		this.id = id;
		this.likedPosts=likedPosts;
	}
	public User(Long id, String username, String password, String email, Profile profile, HashSet<Post> likedPosts, HashSet<Comment> likedComments) {
		this(username, password, email);
		this.profile = profile;
		this.id = id;
		this.likedPosts=likedPosts;
	}
	
	
	
	public void setUsername(String username) {
		this.username = username;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setComments(ArrayList<Comment> comments) {
		this.comments = comments;
	}
	
	public void setPosts(ArrayList<Post> posts) {
		this.posts = posts;
	}
	
	public void setLikedPosts(HashSet<Post> likedPosts) {
		this.likedPosts = likedPosts;
	}
	
	public void setId(long id) {
		this.id = id;
	}
	
	public String getUsername() {
		return username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public long getId() {
		return id;
	}
	public Profile getProfile() {
		return profile;
	}
	public HashSet<Post> getLikedPosts() {
		return likedPosts;
	}
	public void setProfile(Profile profile) {
		this.profile = profile;
	}
	

	public HashSet<Comment> getLikedComments() {
		return likedComments;
	}
	public void setLikedComments(HashSet<Comment> likedComments) {
		this.likedComments = likedComments;
	}
	
	public boolean checkLikedPost(int idPost){
		for (Iterator iterator = this.likedPosts.iterator(); iterator.hasNext();) {
			Post post = (Post) iterator.next();
			if(idPost==post.getPostId()){
				return true;
			}	
		}
		return false;
	}
	
	public void addLikedPost(Post post){
		this.likedPosts.add(post);
	}
	public void removeLikedPost(Post post){
		this.likedPosts.remove(post);
	}
	

}
