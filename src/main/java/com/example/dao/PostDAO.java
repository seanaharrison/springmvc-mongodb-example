package com.example.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.example.domain.Post;

@Repository
public class PostDAO {

	@Autowired
	MongoOperations mongoTemplate;

	public void savePost(Post post) {
		mongoTemplate.save(post);
	}
	
	public void deletePost(Post post) {
		mongoTemplate.remove(post);
	}

	public List<Post> getAllPosts() {
		//new mongodb query
		Query query = new Query();
		//sort by date
		query.with(new Sort(Sort.Direction.DESC,"date"));
		//run query
		ArrayList<Post> allPostList = (ArrayList<Post>) mongoTemplate
				.find(query, (Post.class));
		return allPostList;
	}
	
	public List<Post> getAllUsersPosts(String user) {
		//find post by user
		Query query = new Query(Criteria.where("user").is(user));	
		//sort by date
		query.with(new Sort(Sort.Direction.DESC,"date"));
		//run query
		ArrayList<Post> allPostList = (ArrayList<Post>) mongoTemplate
				.find(query, (Post.class));
		return allPostList;
	}

	public Post getPostById(String id) {
		Query query = new Query(Criteria.where("_id").is(id));
		Post post = (Post) mongoTemplate.findOne(query, (Post.class));
		return post;
	}
}
