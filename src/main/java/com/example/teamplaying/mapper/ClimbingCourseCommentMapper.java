package com.example.teamplaying.mapper;

import com.example.teamplaying.domain.*;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface ClimbingCourseCommentMapper {
	@Select("""
			SELECT *
			FROM ClimbingCourseComment
			WHERE id = #{id}
			""")
	ClimbingCourseComment selectById(Integer id);

	@Insert("""
			INSERT INTO ClimbingCourseComment (boardId, content, memberId)
			VALUES (#{boardId}, #{content}, #{memberId})
			""")
	Integer insert(ClimbingCourseComment comment);

	@Select("""
			SELECT *
			FROM ClimbingCourseComment
			WHERE boardId = #{boardId}
			ORDER BY id
			""")
	List<ClimbingCourseComment> selectAllByBoardId(Integer boardId);

	@Update("""
			UPDATE ClimbingCourseComment
			SET
				content = #{content},
				inserted = #{inserted}
			WHERE
				id = #{id}
			""")
	Integer update(ClimbingCourseComment comment);

	@Delete("""
			DELETE FROM ClimbingCourseComment
			WHERE id = #{id}
			""")
	Integer deleteById(Integer id);

	@Delete("""
			DELETE FROM ClimbingCourseComment
			WHERE boardId = #{boardId}
			""")
	void deleteByBoardId(Integer boardId);

}
