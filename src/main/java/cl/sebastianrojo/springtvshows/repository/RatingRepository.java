package cl.sebastianrojo.springtvshows.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import cl.sebastianrojo.springtvshows.model.Rating;

/**
 * RatingRepository
 */
@Repository
public interface RatingRepository extends JpaRepository<Rating, Long> {

    List<Rating> findAll();
    
}