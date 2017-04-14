/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service;

import com.database.TweetManager;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author jagadeesh
 */
public class tweetDetailService {
    
    public List<HashMap<String, String>> getTweetDetailListFromTopic(String topicName){
        TweetManager tmgr =new TweetManager();
        List<HashMap<String, String>> tweetDetailList = tmgr.getTweetListFromTopic(topicName);
        return tweetDetailList;
    }
    
    public  HashMap<String,Integer>  getDashBoardTweetData(String topicName){
        TweetManager tmgr =new TweetManager();
        List<HashMap<String, String>> tweetDetailList = tmgr.getTweetListFromTopic(topicName);
        int positiveTweetCount=0,negativeTweetCount=0,totalTweetCount=0;
        for(HashMap<String, String> tweetDetail: tweetDetailList ){
            if(tweetDetail.get("SentiScore").equals("0"))
                negativeTweetCount ++;
            else
                positiveTweetCount ++;
            totalTweetCount++;
                
        }
        HashMap<String,Integer> dashBoardDataMap = new  HashMap<String,Integer>() ;
        dashBoardDataMap.put("negativeTweetCount",negativeTweetCount);
        dashBoardDataMap.put("positiveTweetCount",positiveTweetCount);
        dashBoardDataMap.put("totalTweetCount",totalTweetCount);
        return dashBoardDataMap;
    }
}
