package cl.sebastianrojo.springtvshows.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import cl.sebastianrojo.springtvshows.model.User;

/**
 * UserRepository
 */
@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    List<User> findAll();
    
    User findByUsername(String username);

    User findByEmail(String email);
    
}