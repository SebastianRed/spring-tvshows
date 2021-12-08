package cl.sebastianrojo.springtvshows.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cl.sebastianrojo.springtvshows.model.Rating;
import cl.sebastianrojo.springtvshows.repository.RatingRepository;

/**
 * RatingService
 */
@Service
public class RatingService {

    @Autowired
    private RatingRepository ratingRepository;

    public List<Rating> findAllRatings() {
        return ratingRepository.findAll();
    }

    public Rating findRatingById(Long id) {
        Optional<Rating> optionalRating = ratingRepository.findById(id);
        if(optionalRating.isPresent()) {
            return optionalRating.get();
        } else {
            return null;
        }
    }

    public void addRating(Rating rating) {
        ratingRepository.save(rating);
    }
}