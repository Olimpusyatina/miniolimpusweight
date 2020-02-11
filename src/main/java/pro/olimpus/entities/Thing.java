package pro.olimpus.entities;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Thing {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String thingmame;
    private double weight;
    private boolean def;
    @ManyToMany
    @JoinTable (
            name = "olimpus_things",
            joinColumns =  {@JoinColumn(name = "thing_id")},
            inverseJoinColumns = {@JoinColumn(name = "ow_id")}
    )
    private Set<OlimpusWeight> things = new HashSet<>();

    public Set<OlimpusWeight> getThings() {
        return things;
    }

    public void setThings(Set<OlimpusWeight> things) {
        this.things = things;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getThingmame() {
        return thingmame;
    }

    public void setThingmame(String thingname) {
        this.thingmame = thingname;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public boolean isDef() {
        return def;
    }

    public void setDef(boolean def) {
        this.def = def;
    }
}
