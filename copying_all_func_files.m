function copying_all_func_files(function_name,out_path);

%checking outpath
if out_path(end)~='\'
    out_path=[out_path,'\'];
end

[fList,~] = matlab.codetools.requiredFilesAndProducts(function_name);

part_names=cellfun(@(a) strfind(a,'\'),fList,'UniformOutput',false);
part_ind=cellfun(@(a) a(end),part_names,'UniformOutput',false);
ind=cell2mat(part_ind);
fnames=cellfun(@(a) a(ind+1:end),fList,'UniformOutput',false);

for i=1:length(fList);
    copyfiles(fList{i},[out_path,fnames(i)]);
end

