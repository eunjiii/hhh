package org.honeyrock.controller;

import org.honeyrock.domain.BoardVO;
import org.honeyrock.domain.PageParam;
import org.honeyrock.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

	private BoardService service;

	@GetMapping("/list")
	public void getList(Model model, @ModelAttribute("pageObj") PageParam pageParam) {
		pageParam.setTotal(service.count());
		model.addAttribute("list", service.getList(pageParam));
	}

	@GetMapping("/register")
	public void registerGet() {

	}

	@PostMapping("/register")
	public String registerPost(BoardVO board, RedirectAttributes rttr) {

		rttr.addFlashAttribute("result", service.register(board));

		return "redirect:/board/list";

	}

	@GetMapping({"/read","/modify"})
	public void readGet(@ModelAttribute("pageObj") PageParam pageParam, Model model) {
		model.addAttribute("board", service.read(pageParam));
	}

	@PostMapping("/delete")
	public String deletePost(BoardVO board, RedirectAttributes rttr) {

		rttr.addFlashAttribute("result", service.delete(board));

		return "redirect:/board/list";

	}
	
	@PostMapping("/modify")
	public String modifyPost(BoardVO board, RedirectAttributes rttr) {

		rttr.addFlashAttribute("result", service.modify(board));

		return "redirect:/board/list";
	}
	

}