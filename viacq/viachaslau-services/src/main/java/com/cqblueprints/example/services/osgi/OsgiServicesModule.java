package com.cqblueprints.example.services.osgi;

import com.cqblueprints.example.services.GoodbyeWorldService;
import com.day.cq.search.QueryBuilder;
import com.google.inject.AbstractModule;

import static org.ops4j.peaberry.Peaberry.service;

public class OsgiServicesModule extends AbstractModule {

    @Override
    protected void configure() {
        // how to bind OSGi services
        bind(QueryBuilder.class).toProvider(service(QueryBuilder.class).single());

        // how to bind own services
        bind(GoodbyeWorldService.class).toProvider(service(GoodbyeWorldService.class).single());
    }
}
