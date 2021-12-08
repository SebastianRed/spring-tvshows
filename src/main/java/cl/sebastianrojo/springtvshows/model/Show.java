package cl.sebastianrojo.springtvshows.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

/**
 * Show
 */
@Entity
public class Show {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_show", nullable = false, unique = true)
    private Long id;
    private String showTitle;
    private String showNetwork;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(name = "show_rating", joinColumns = @JoinColumn(name = "id_show"), inverseJoinColumns = @JoinColumn(name = "id_rating"))
    private List<Rating> ratings;
    
    public Show() {
    }

    public Show(Long id, String showTitle, String showNetwork) {
        this.id = id;
        this.showTitle = showTitle;
        this.showNetwork = showNetwork;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Rating> getRatings() {
        return ratings;
    }

    public void setRatings(List<Rating> ratings) {
        this.ratings = ratings;
    }

    public String getShowTitle() {
        return showTitle;
    }

    public void setShowTitle(String showTitle) {
        this.showTitle = showTitle;
    }

    public String getShowNetwork() {
        return showNetwork;
    }

    public void setShowNetwork(String showNetwork) {
        this.showNetwork = showNetwork;
    }

    @Override
    public String toString() {
        return "Show [id=" + id + ", showNetwork=" + showNetwork + ", showTitle=" + showTitle + "]";
    }

}