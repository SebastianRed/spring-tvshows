package cl.sebastianrojo.springtvshows.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * Show
 */
@Entity
public class Show {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String showTitle;
    private String showNetwork;
    
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