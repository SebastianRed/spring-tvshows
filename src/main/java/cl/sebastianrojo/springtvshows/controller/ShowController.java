package cl.sebastianrojo.springtvshows.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import cl.sebastianrojo.springtvshows.model.Rating;
import cl.sebastianrojo.springtvshows.model.Show;
import cl.sebastianrojo.springtvshows.model.User;
import cl.sebastianrojo.springtvshows.service.RatingService;
import cl.sebastianrojo.springtvshows.service.ShowService;
import cl.sebastianrojo.springtvshows.service.UserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * ShowController
 */
@Controller
@RequestMapping("/shows")
public class ShowController {

    @Autowired
    private UserService userService;

    @Autowired
    private ShowService showService;

    @Autowired
    private RatingService ratingService;

    @PostMapping(value = "/{id}/add")
    public String addRating(@Valid @ModelAttribute("addRating") Rating rating, BindingResult result,
            @PathVariable("id") Long id, Principal principal) {
        if (result.hasErrors()) {
            return "redirect:/shows/" + id;
        } else {
            String email = principal.getName();
            User currentUser = userService.findUserByEmail(email);
            Show currentShow = showService.findShowById(id);
            rating.setUser(currentUser);
            ratingService.addRating(rating);
            currentShow.setRatings(ratingService.findAllRatings());
            showService.updateShow(currentShow);
            return "redirect:/shows/" + id;
        }
    }

    @GetMapping(value = "/{id}")
    public String getShow(@PathVariable("id") Long id, Model model, Principal principal) {
        Show show = showService.findShowById(id);
        User creatorShow = show.getUser();
        String email = principal.getName();
        User currentUser = userService.findUserByEmail(email);
        List<Rating> showRatings = show.getRatings();
        Rating newRating = new Rating();
        model.addAttribute("addRating", newRating);
        model.addAttribute("showRatings", showRatings);
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("show", show);
        model.addAttribute("creatorShow", creatorShow);
        return "show";
    }

    @GetMapping("")
    public String homePage(Principal principal, Model model) {
        String email = principal.getName();
        User currentUser = userService.findUserByEmail(email);
        List<Show> allShows = showService.findAllShows();
        model.addAttribute("allShows", allShows);
        model.addAttribute("currentUser", currentUser);
        return "home";
    }

    @GetMapping(value = "/new")
    public String newShow(Model model) {
        Show newShow = new Show();
        model.addAttribute("newShow", newShow);
        return "new";
    }

    @PostMapping(value = "/create")
    public String createShow(@Valid @ModelAttribute("newShow") Show show, BindingResult result, Principal principal) {
        if (result.hasErrors()) {
            return "new";
        } else {
            String email = principal.getName();
            User creatorShow = userService.findUserByEmail(email);
            show.setUser(creatorShow);
            showService.saveShow(show);
            return "redirect:/shows";
        }
    }

    @GetMapping(value = "/{id}/edit")
    public String editShow(@PathVariable("id") Long id, Model model, @ModelAttribute("errors") String errors) {
        Show editShow = showService.findShowById(id);
        model.addAttribute("editShow", editShow);
        return "edit";
    }

    @PostMapping(value = "/{id}/edit")
    public String updateShow(@PathVariable("id") Long id, @Valid @ModelAttribute("editShow") Show editedShow,
            BindingResult result, Model model, Principal principal,
            HttpSession session) {
        String email = principal.getName();
        Show show = showService.findShowById(id);
        User creatorShow = userService.findUserByEmail(email);
        if (result.hasErrors()) {
            session.setAttribute("id", show.getId());
            return "redirect:/shows/createError";
        } else {
            editedShow.setUser(creatorShow);
            showService.updateShow(editedShow);
            return "redirect:/shows";
        }
    }

    @GetMapping(value = "/{id}/delete")
    public String deleteShow(@PathVariable("id") Long id) {
        showService.deleteShow(id);
        return "redirect:/shows/";
    }

}