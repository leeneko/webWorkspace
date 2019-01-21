package com.imoxion.board;

import java.util.ArrayList;
import java.util.List;
 
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;

public class MongoTest {
	 
    private MongoTemplate mongoTemplate;
 
    public MongoTest() {
 
        String mongoContextPath = "/mongoContext.xml";
        AbstractApplicationContext ctx = new ClassPathXmlApplicationContext(mongoContextPath);
 
        mongoTemplate = (MongoTemplate) ctx.getBean("mongoTemplate");
    }
 
    public static void main(String[] args) {
        MongoTest mongoTest = new MongoTest();
 
        System.out.println(mongoTest.mongoTemplate);
        mongoTest.insertTestData();
    }
 
    private void insertTestData() {
 
        MongoTestVO testVO = new MongoTestVO();
        testVO.setName("둘리!!");
        testVO.setAddress("고길동 집 1억년전 어딘가...");
         
        // testVO에 있는 내용을 "person" Collection에 넣겠다.
        mongoTemplate.insert(testVO, "person");
    }
 
    private class MongoTestVO {
 
         
        // 반드시 id annotation이 붙은 id 변수가 필요!
        @Id
        private String id;
 
        private String name;
        private String address;
 
        public String getId() {
            return id;
        }
 
        public void setId(String id) {
            this.id = id;
        }
 
        public String getName() {
            return name;
        }
 
        public void setName(String name) {
            this.name = name;
        }
 
        public String getAddress() {
            return address;
        }
 
        public void setAddress(String address) {
            this.address = address;
        }
 
    }
}