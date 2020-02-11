package pro.olimpus.entities;

import javax.persistence.*;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
public class OlimpusWeight {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String startTime;
    private String endTime;
    private double startWeight;
    private double endWeight;
    private Date date;

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @ManyToMany
    @JoinTable (
            name = "olimpus_things",
            joinColumns =  {@JoinColumn(name = "ow_id")},
            inverseJoinColumns = {@JoinColumn(name = "thing_id")}
            )
    private Set<Thing> things = new HashSet<>();

    public Long getId() {
        return id;
    }

    public Set<Thing> getThings() {
        return things;
    }

    public void setThings(Set<Thing> things) {
        this.things = things;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public double getStartWeight() {
        return startWeight;
    }

    public void setStartWeight(double startWeight) {
        this.startWeight = startWeight;
    }

    public double getEndWeight() {
        return endWeight;
    }

    public void setEndWeight(double endWeight) {
        this.endWeight = endWeight;
    }
}
