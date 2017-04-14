/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service;

import com.database.TweetManager;
import java.util.*;

/**
 *
 * @author jagadeesh
 */
public class tweetTopicService {

    public List<String> getTweetTopicList() {
        TweetManager tmgr = new TweetManager();
        List<String> tweettopiclist = tmgr.getAllTweetTopics();
        return tweettopiclist;
    }
    
    public int insertTweetsFromTopic(String topicName){
        TweetManager tmgr = new TweetManager();
        return tmgr.insertTweetsFromTopicName(topicName);
    }
}
