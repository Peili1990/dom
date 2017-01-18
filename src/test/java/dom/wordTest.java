package dom;

import java.util.List;

import org.apdplat.word.WordSegmenter;
import org.apdplat.word.dictionary.DictionaryFactory;
import org.apdplat.word.segmentation.Word;
import org.apdplat.word.util.WordConfTools;
import org.junit.Test;
import org.nv.dom.util.ConfigUtil;

public class wordTest {
	
	private String filePath = ConfigUtil.getVersionConfigProperty("img.filepath");
	
	@Test
	public void test(){
		WordConfTools.set("dic.path", filePath+"nv_dict.txt");
		WordConfTools.set("punctuation.path", "classpath:blank_file.txt");
        DictionaryFactory.reload();
		List<Word> words = WordSegmenter.segWithStopWords("杨、尚川是，APDPlat应用。级产<br>品开上校发平台的霍尔作者？");
		System.out.println(words.toString());
	}

}
