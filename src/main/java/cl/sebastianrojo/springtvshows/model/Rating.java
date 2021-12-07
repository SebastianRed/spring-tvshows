package cl.sebastianrojo.springtvshows.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

/**
 * Rating
 */
@Entity
public class Rating {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false, unique = true)
    private Long id;

    private Integer rating;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id")
    private User user;

    @ManyToMany(mappedBy = "rating")
    private List<Show> shows;

    public Rating() {
    }

    public Rating(Long id, Integer rating) {
        this.id = id;
        this.rating = rating;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }
    
}