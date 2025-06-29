package com.ooad6.ecommerce.controller;

import com.ooad6.ecommerce.model.Cart;
import com.ooad6.ecommerce.model.User;
import com.ooad6.ecommerce.repository.CartRepository;
import com.ooad6.ecommerce.repository.ItemsSearch;
import com.ooad6.ecommerce.repository.UserRepository;
import org.springframework.data.domain.Sort;
import org.springframework.ui.Model;
import com.ooad6.ecommerce.model.Items;
import com.ooad6.ecommerce.repository.ItemsShow;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;

@Controller
@CrossOrigin(origins = "*")
public class HomeController {
    @Autowired
    private ItemsShow itemRepository;

    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private ItemsSearch itemsSearch;
    @Autowired
    private UserRepository userRepository;

    @RequestMapping("/homepage")
    public String homepage(Model model, HttpSession session,
                           @RequestParam(name = "sortBy", required = false) String sortBy,
                           @RequestParam(name = "sortOrder", required = false, defaultValue = "asc") String sortOrder) {
        Sort sort = null;

        if (sortBy != null && !sortBy.isEmpty()) {
            Sort.Direction direction = sortOrder.equalsIgnoreCase("desc") ? Sort.Direction.DESC : Sort.Direction.ASC;
            if (sortBy.equalsIgnoreCase("cost")) {
                sort = Sort.by(direction, "Cost");
            } else if (sortBy.equalsIgnoreCase("stock")) {
                sort = Sort.by(direction, "Stock");
            }
        }

        List<Items> itemsList;
        if (sort != null) {
            itemsList = itemRepository.findAll(sort);
        } else {
            itemsList = itemRepository.findAll(); // Default: No sorting
        }

        model.addAttribute("items", itemsList);

        Object userIdObj = session.getAttribute("userid");
        if (userIdObj != null) { // Check if userIdObj is not null before casting
            int userId = (Integer) userIdObj;
            Optional<User> user = userRepository.findByuserId(userId);
            if (user.isPresent()) { // Check if user is present before accessing
                model.addAttribute("username", user.get().getName());
            } else {
                model.addAttribute("username", "Guest"); // Handle case where user is not found
            }
        } else {
            model.addAttribute("username", "Guest"); // Handle case where userid is not in session
        }

        return "home";
    }

    @PostMapping("/addToCart")
    @ResponseBody
    public String addToCart(@RequestParam String itemId, @RequestParam int userid, @RequestParam String itemName,
                            @RequestParam int cost, @RequestParam int qty,
                            @RequestParam String description) {
        if (userid == 0) {
            return "User ID is missing!";
        }

        Cart cartItem = new Cart(itemId, userid, itemName, cost, qty, description);
        cartRepository.save(cartItem);
        return itemName+" added to cart! for user with ID " + userid;
    }

    @GetMapping("/search/{text}")
    @ResponseBody
    public List<Items> search(@PathVariable String text) {
        System.out.println("Received search query: " + text); // ✅ Debugging
        List<Items> results = itemsSearch.findByText(text);
        System.out.println("Search results: " + results); // ✅ Debugging
        return results;
    }
}