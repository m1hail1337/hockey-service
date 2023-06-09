package com.example.hockey.core.tournament.web;

import com.example.hockey.core.team.web.TeamView;

import java.io.Serializable;
import java.util.Set;

public class TournamentView implements Serializable {

    private Long id;

    private String name;

    private String country;

    private Set<TeamView> teams;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public Set<TeamView> getTeams() {
        return teams;
    }

    public void setTeams(Set<TeamView> teams) {
        this.teams = teams;
    }
}
