package com.codegnan.cgecom.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.codegnan.cgecom.model.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {}