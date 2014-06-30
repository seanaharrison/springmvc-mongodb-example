package com.example.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.PostDAO;
import com.example.domain.Post;

@Service
public class PostBO {

	private PostDAO postDAO;

	@Autowired
	public void setPostDao(PostDAO postDAO) {
		this.postDAO = postDAO;
	}
	
	public void savePost(Post post) {
		this.postDAO.savePost(post);
	}
	
	public void deletePost(Post post) {
		this.postDAO.deletePost(post);
	}
	
	public List<Post> getAllPosts(){
		return this.postDAO.getAllPosts();
	}
	
	public List<Post> getAllUsersPosts(String user){
		return this.postDAO.getAllUsersPosts(user);
	}
	
	public Post getPostById(String id){
		return this.postDAO.getPostById(id);
	}
}
