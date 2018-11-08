package org.honeyrock.service;

import java.util.List;

import org.honeyrock.domain.BoardVO;
import org.honeyrock.domain.PageParam;
import org.springframework.stereotype.Service;

@Service
public interface BoardService {
	
	public List<BoardVO> getList(PageParam pageParam);
	
	public int register(BoardVO board);
	
	public BoardVO read(PageParam pageParam);
	
	public int delete(BoardVO board);
	
	public int modify(BoardVO board);
	
	public int count();
}
