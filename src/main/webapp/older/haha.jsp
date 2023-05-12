<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>stickcode_summernote</title>
</head>
<body>

<textarea rows="20" name="form-control" id="form-control"></textarea>

<script src="../smarteditor2/dist/js/service/HuskyEZCreator.js" charset="utf-8"></script>
	<script>
window.onload = function() {
    var oEditors = [];
    function smartEditorIFrame() {
        nhn.husky.EZCreator.createInIFrame({
            oAppRef : oEditors,
            elPlaceHolder : "form-control",
            sSkinURI : "../smarteditor2/SmartEditor2Skin.html",
            fCreator : "createSEditor2"
        });
    }
    smartEditorIFrame();
};
</script>
</body>
</html>