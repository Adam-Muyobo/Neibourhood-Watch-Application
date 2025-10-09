package com.softwaredesignub.neibourhoodwatchapi.api.users;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;

    public List<UserDTO> getAllUsers() {
        return userRepository.findAll()
                .stream()
                .map(UserMapper::toDto)
                .toList();
    }

    public UserDTO getUserById(Long id) {
        return userRepository.findById(id)
                .map(UserMapper::toDto)
                .orElseThrow(() -> new RuntimeException("User not found with id " + id));
    }

    public UserDTO createUser(UserDTO dto) {
        User user = UserMapper.toEntity(dto);
        User saved = userRepository.save(user);
        return UserMapper.toDto(saved);
    }

    public UserDTO updateUser(Long id, UserDTO dto) {
        User existing = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found with id " + id));

        existing.setFirstName(dto.getFirstName());
        existing.setLastName(dto.getLastName());
        existing.setPhoneNumber(dto.getPhoneNumber());
        existing.setIsActive(dto.getIsActive());

        User updated = userRepository.save(existing);
        return UserMapper.toDto(updated);
    }

    public void deleteUser(Long id) {
        userRepository.deleteById(id);
    }

    // Signup
    public User signup(UserDTO dto) {
        if (userRepository.findByUsername(dto.getUsername()).isPresent() ||
                userRepository.findByEmail(dto.getEmail()).isPresent()) {
            throw new RuntimeException("Username or email already exists");
        }

        User user = User.builder()
                .username(dto.getUsername())
                .firstName(dto.getFirstName())
                .lastName(dto.getLastName())
                .email(dto.getEmail())
                .phoneNumber(dto.getPhoneNumber())
                .password(dto.getPassword()) // plain text for now
                .isActive(true)
                .lastLogin(LocalDateTime.now())
                .build();

        return userRepository.save(user);
    }

    // Login
    public User login(LoginRequest request) {
        Optional<User> userOpt = userRepository.findByUsername(request.getUsername());
        if (userOpt.isEmpty() || !userOpt.get().getPassword().equals(request.getPassword())) {
            throw new RuntimeException("Invalid username or password");
        }

        User user = userOpt.get();
        user.setLastLogin(LocalDateTime.now());
        return userRepository.save(user);
    }
}
