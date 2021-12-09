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
import javax.persistence.Table;
import javax.validation.constraints.Size;

/**
 * Show
 */
@Entity
@Table(name="shows")
public class Show {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="show_id", nullable = false, unique = true)
	private Long id;
	
	@Size(min=1, message = "Title must be present")
	private String showTitle;
	
	@Size(min=1, message = "Network must be present")
	private String showNetwork;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private User users;
	
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "shows_ratings", joinColumns = @JoinColumn(name = "show_id"), inverseJoinColumns = @JoinColumn(name = "rating_id"))
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

    public User getUsers() {
        return users;
    }

    public void setUsers(User users) {
        this.users = users;
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