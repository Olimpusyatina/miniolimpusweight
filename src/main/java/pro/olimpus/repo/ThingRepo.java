package pro.olimpus.repo;

import org.springframework.data.repository.CrudRepository;
import pro.olimpus.entities.Thing;

public interface ThingRepo extends CrudRepository<Thing, Long> {
    public Thing getThingByThingmame(String name);
}
