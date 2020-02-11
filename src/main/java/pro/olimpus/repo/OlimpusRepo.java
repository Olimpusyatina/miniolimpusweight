package pro.olimpus.repo;

import org.springframework.data.repository.CrudRepository;
import pro.olimpus.entities.OlimpusWeight;
import pro.olimpus.entities.Thing;

import java.util.Set;

public interface OlimpusRepo extends CrudRepository<OlimpusWeight, Long> {
}
