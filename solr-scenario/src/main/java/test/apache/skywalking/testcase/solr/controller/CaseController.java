/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

package test.apache.skywalking.testcase.solr.controller;


import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.request.CollectionAdminRequest;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrInputDocument;
import org.apache.solr.common.params.CommonParams;
import org.apache.solr.common.params.ModifiableSolrParams;
import org.apache.solr.common.util.NamedList;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicBoolean;

@RestController
@RequestMapping("/solr-scenario/case")
public class CaseController {
    private Logger logger = LogManager.getLogger(CaseController.class);

    @Value("${solr.host}")
    private String host;

    private String collection = "mycore";

    @GetMapping("/solr")
    public String solr() throws SolrServerException, IOException {
        HttpSolrClient client = getClient();
//        init(client);

        add(client);

        commit(client);

        optimize(client);

        search(client);

        get(client);

        deleteById(client);

        deleteByQuery(client);

        client.close();
        return "Success";
    }

    boolean status = false;
    synchronized void init(HttpSolrClient client) throws IOException, SolrServerException {
        if (status) return;
        CollectionAdminRequest.Create creater = CollectionAdminRequest.createCollection(collection, "_default", 2, 2);
        creater.setMaxShardsPerNode(2);
        client.request(creater);
        status = true;
    }

    public String add(HttpSolrClient client) throws SolrServerException, IOException {
        List<SolrInputDocument> docs = new ArrayList<>();
        for (int i=0; i<100; i++) {
            SolrInputDocument doc = new SolrInputDocument();
            doc.addField("id", i);
            docs.add(doc);
        }
        client.add(collection, docs);
        return "Success";
    }

    public String commit(HttpSolrClient client) throws SolrServerException, IOException {
        client.commit(collection);
        return "Success";
    }

    public String optimize(HttpSolrClient client) throws SolrServerException, IOException {
        client.optimize(collection);
        return "Success";
    }
    public String search(HttpSolrClient client) throws IOException, SolrServerException {
        ModifiableSolrParams params = new ModifiableSolrParams();
        params.set(CommonParams.Q, "*:*");
        params.set(CommonParams.OMIT_HEADER, true);
        QueryResponse response = client.query(collection, params);
        return "Success";
    }

    public String get(HttpSolrClient client) throws SolrServerException, IOException {
        client.getById(collection, "1"); //
        return "Success";
    }

    public String deleteById(HttpSolrClient client) throws SolrServerException, IOException {
        client.deleteById(collection, "2"); //
        return "Success";
    }

    public String deleteByQuery(HttpSolrClient client) throws SolrServerException, IOException {
        client.deleteByQuery(collection, "*:*"); //
        return "Success";
    }

    private final HttpSolrClient getClient() {
        return new HttpSolrClient.Builder(String.format("http://%s/solr/", host)).build();
    }
}

