package com.codegnan.cgecom.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.codegnan.cgecom.model.Brand;

@Repository
public interface BrandRepository extends JpaRepository<Brand, Integer> {}