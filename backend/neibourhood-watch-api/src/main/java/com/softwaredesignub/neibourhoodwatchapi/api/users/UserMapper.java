package com.softwaredesignub.neibourhoodwatchapi.api.users;

public class UserMapper {

    public static User toEntity(UserDTO dto) {
        if (dto == null) return null;

        return User.builder()
                .username(dto.getUsername())
                .firstName(dto.getFirstName())
                .lastName(dto.getLastName())
                .email(dto.getEmail())
                .phoneNumber(dto.getPhoneNumber())
                .isActive(dto.getIsActive() != null ? dto.getIsActive() : true)
                .build();
    }

    public static UserDTO toDto(User entity) {
        if (entity == null) return null;

        return new UserDTO(
                entity.getUsername(),
                entity.getFirstName(),
                entity.getLastName(),
                entity.getEmail(),
                entity.getPhoneNumber(),
                entity.getPassword(),
                entity.getIsActive()
        );
    }
}
